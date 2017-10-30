# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
Rails.application.config.assets.precompile += %w( bootstrap.css styles.css datatables.min.css )
Rails.application.config.assets.precompile += %w( font-awesome.min.css )
Rails.application.config.assets.precompile += %w( datepicker.css  )
Rails.application.config.assets.precompile += %w( chart.min.js chart-data.js)
Rails.application.config.assets.precompile += %w( jquery-1.11.1.min.js )
Rails.application.config.assets.precompile += %w( respond.min.js )
Rails.application.config.assets.precompile += %w( html5shiv.js )
Rails.application.config.assets.precompile += %w( bootstrap.js custom.js datatables.min.js)








