use std::io;
use std::marker::PhantomData;
use std::default::Default;
use hyper;
use hyper::{Request, Response, Error, StatusCode};
use server::url::form_urlencoded;
use swagger::auth::{Authorization, AuthData, Scopes};
use swagger::{Has, Pop, Push, XSpanIdString};
use Api;

pub struct NewService<T, C>
    where
        C: Default + Push<XSpanIdString>,
        C::Result: Push<Option<AuthData>>,
        T: hyper::server::NewService<Request = (Request, <C::Result as Push<Option<AuthData>>>::Result), Response = Response, Error = Error>,
{
    inner: T,
    marker: PhantomData<C>,
}

impl<T, C> NewService<T, C>
    where
        C: Default + Push<XSpanIdString>,
        C::Result: Push<Option<AuthData>>,
        T: hyper::server::NewService<Request = (Request, <C::Result as Push<Option<AuthData>>>::Result), Response = Response, Error = Error> + 'static,
{
    pub fn new(inner: T) -> NewService<T, C> {
        NewService {
            inner,
            marker: PhantomData,
        }
    }
}

impl<T, C> hyper::server::NewService for NewService<T, C>
    where
        C: Default + Push<XSpanIdString>,
        C::Result: Push<Option<AuthData>>,
        T: hyper::server::NewService<Request = (Request, <C::Result as Push<Option<AuthData>>>::Result), Response = Response, Error = Error> + 'static,
{
    type Request = Request;
    type Response = Response;
    type Error = Error;
    type Instance = Service<T::Instance, C>;

    fn new_service(&self) -> Result<Self::Instance, io::Error> {
        self.inner.new_service().map(|s| Service::new(s))
    }
}

/// Middleware to extract authentication data from request
pub struct Service<T, C>
    where
        C: Default + Push<XSpanIdString>,
        C::Result: Push<Option<AuthData>>,
        T: hyper::server::Service<Request = (Request, <C::Result as Push<Option<AuthData>>>::Result), Response = Response, Error = Error>,
{
    inner: T,
    marker: PhantomData<C>,
}

impl<T, C> Service<T, C>
    where
        C: Default + Push<XSpanIdString>,
        C::Result: Push<Option<AuthData>>,
        T: hyper::server::Service<Request = (Request, <C::Result as Push<Option<AuthData>>>::Result), Response = Response, Error = Error>,
{
    pub fn new(inner: T) -> Service<T, C> {
        Service {
            inner,
            marker: PhantomData,
        }
    }
}

impl<T, C> hyper::server::Service for Service<T, C>
    where
        C: Default + Push<XSpanIdString>,
        C::Result: Push<Option<AuthData>>,
        T: hyper::server::Service<Request = (Request, <C::Result as Push<Option<AuthData>>>::Result), Response = Response, Error = Error>,
{
    type Request = Request;
    type Response = Response;
    type Error = Error;
    type Future = T::Future;

    fn call(&self, req: Self::Request) -> Self::Future {
        let context = C::default().push(XSpanIdString::get_or_generate(&req));

        {
            header! { (ApiKey1, "api_key") => [String] }
            if let Some(header) = req.headers().get::<ApiKey1>().cloned() {
                let auth_data = AuthData::ApiKey(header.0);
                let context = context.push(Some(auth_data));
                return self.inner.call((req, context));
            }
        }
        {
            use hyper::header::{Authorization, Basic, Bearer};
            use std::ops::Deref;
            if let Some(bearer) = req.headers().get::<Authorization<Bearer>>().cloned() {
                let auth_data = AuthData::Bearer(bearer.deref().clone());
                let context = context.push(Some(auth_data));
                return self.inner.call((req, context));
            }
        }

        let context = context.push(None);
        return self.inner.call((req, context));
    }
}
