defmodule CrudTddWeb.Router do
  use CrudTddWeb, :router

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

  scope "/", CrudTddWeb do
    pipe_through :api

    get "/games", GamesController, :index
    post "/games", GamesController, :create
    get "/games/:id", GamesController, :show
    put "/games/:id", GamesController, :update
    delete "/games/:id", GamesController, :delete
  end

  scope "/", CrudTddWeb do
    pipe_through :browser

    get "/", PageController, :index
    get "/users", UserController, :index
    get "/users/new", UserController, :new
    post "/users", UserController, :create
    get "/users/:id", UserController, :show
    get "/users/:id/edit", UserController, :edit
    delete "/users/:id", UserController, :delete
    put "/users/:id", UserController, :update
  end

  # Other scopes may use custom stacks.
  # scope "/api", CrudTddWeb do
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
      live_dashboard "/dashboard", metrics: CrudTddWeb.Telemetry
    end
  end
end
