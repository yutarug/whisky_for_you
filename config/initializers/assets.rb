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
# Rails.application.config.assets.precompile += %w( admin.js admin.css )

Rails.application.config.assets.precompile += %w(
    public/diagnoses/diagnosis.scss
    public/diagnoses/reset.scss
    public/diagnoses/result.scss
    public/diagnoses/reset_result.scss
    public/homes/top.scss
    public/homes/reset.scss
    public/bottles/bottle.scss
    public/bottles/bottle-reset.scss
    public/bottles/bottles.scss
    public/bottles/bottles-reset.scss
    public/images/image.scss
    public/images/reset.scss
    public/searches/search.scss
    public/searches/reset.scss
    public/columns/columns.scss
    public/columns/columns-reset.scss
    public/columns/column.scss
    public/columns/column-reset.scss
 )
