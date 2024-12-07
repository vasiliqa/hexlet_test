Sentry.init do |config|
    config.dsn = "https://e6bc6f6c6cb31a540d50cc663317062a@o4508358369607680.ingest.de.sentry.io/4508376823234640"
    config.breadcrumbs_logger = [ :active_support_logger, :http_logger ]

    # Set traces_sample_rate to 1.0 to capture 100%
    # of transactions for tracing.
    # We recommend adjusting this value in production.
    config.traces_sample_rate = 1.0
    # or
    config.traces_sampler = lambda do |context|
      true
    end
    # Set profiles_sample_rate to profile 100%
    # of sampled transactions.
    # We recommend adjusting this value in production.
    config.profiles_sample_rate = 1.0
  end
