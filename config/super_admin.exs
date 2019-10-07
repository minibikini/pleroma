use Mix.Config

config :pleroma, Pleroma.Web.Endpoint, live_view: [signing_salt: "fPeO2nN3"]

config :super_admin, config: &Pleroma.Web.SuperAdmin.config/0
