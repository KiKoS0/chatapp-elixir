defmodule ChatappWeb.Router do
  use ChatappWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  forward "/api/swagger", PhoenixSwagger.Plug.SwaggerUI,
    otp_app: :chatapp,
    swagger_file: "swagger.json"

  scope "/api/v1", ChatappWeb do
    pipe_through :api

    post "/users/login", UserController, :login
    resources "/users", UserController, only: [:show, :create]

    resources "/channels", ChannelController, only: [:index, :show, :create] do
      resources "/messages", MessageController, only: [:create, :index]
    end
  end

  def swagger_info do
    %{
      info: %{
        version: "1.0",
        title: "Chat app"
      }
    }
  end

  scope "/", ChatappWeb do
    pipe_through :browser

    get "/auth/google/callback", GoogleAuthController, :index
    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", ChatappWeb do
  #   pipe_through :api
  # end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser
      live_dashboard "/dashboard", metrics: ChatappWeb.Telemetry
    end
  end
end
