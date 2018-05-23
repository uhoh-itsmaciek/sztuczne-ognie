require "pliny/config_helpers"

# Access all config keys like the following:
#
#     Config.database_url
#
# Each accessor corresponds directly to an ENV key, which has the same name
# except upcased, i.e. `DATABASE_URL`.
module Config
  extend Pliny::CastingConfigHelpers

  # Mandatory -- exception is raised for these variables when missing.
  mandatory :database_url, string

  # Optional -- value is returned or `nil` if it wasn't present.
  optional :app_name,            string
  optional :placeholder,         string
  optional :versioning_default,  string
  optional :versioning_app_name, string

  # Override -- value is returned or the set default.
  override :database_timeout, 10,    int
  override :db_pool,          5,    int
  override :deployment,       'production', string
  override :force_ssl,        true,  bool
  override :pliny_env,        'development', string
  override :port,             5000, int
  override :pretty_json,      false, bool
  override :puma_max_threads, 16,   int
  override :puma_min_threads, 1,    int
  override :puma_workers,     3,    int
  override :raise_errors,     false,         bool
  override :root,             File.expand_path("../../", __FILE__), string
  override :timeout,          10,    int
  override :versioning,       false, bool

  override :fuse_len,         3, int
  override :hint_count,       7, int
  override :max_players       5, int

  def self.colors
    %w(red green blue white yellow)
  end

  def self.values
    (1..5).to_a
  end
end
