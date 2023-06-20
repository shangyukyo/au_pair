# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
Rails.application.config.assets.precompile += %w( 
	login.css
	admin.css 
	fusion-shortcodes.min-ver=1.7.2.css
	animations.min-ver=1.7.2.css
	pum-site-styles-generated.css

	greensock-ver=1.19.0.js
	layerslider.kreaturamedia.jquery-ver=6.7.6.js
	layerslider.transitions-ver=6.7.6.js
	jquery.themepunch.tools.min-ver=5.4.7.4.js
	jquery.themepunch.revolution.min-ver=5.4.7.4.js
)
