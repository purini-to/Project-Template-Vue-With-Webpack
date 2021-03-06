"use strict"

gulp = require "gulp"
$ = do require "gulp-load-plugins"

settings = require "../settings"
webpackSettings = require "../webpack.settings"

# src内のファイルを対象に、webpackを通してdistディレクトリにコンパイルします
gulp.task "build:webpack", (callback) ->
  myConfig = Object.create webpackSettings
  myConfig.devtool = 'source-map'
  myConfig.debug = true

  gulp.src settings.src
  .pipe $.plumber()
  .pipe $.webpack myConfig, null, (err, stats) ->
    if err?
      throw new $.util.PluginError "build:webpack", err
    $.util.log "[build:webpack]", stats.toString({
      colors: true
    })
  .pipe gulp.dest settings.js.dist

# src内のファイルを対象に、webpackを通してdistディレクトリにコンパイルします
gulp.task "build:webpack:minify", (callback) ->
  webpack = $.webpack.webpack
  myConfig = Object.create webpackSettings
  myConfig.plugins = myConfig.plugins.concat(
    new webpack.DefinePlugin({
      'process.env': {
        NODE_ENV: JSON.stringify("production")
      }
    })
    new webpack.optimize.UglifyJsPlugin({
      compress: {
        warnings: false
      }
    })
    new webpack.optimize.DedupePlugin()
    new webpack.optimize.OccurenceOrderPlugin()
    new webpack.optimize.AggressiveMergingPlugin()
  )

  gulp.src settings.src
  .pipe $.plumber()
  .pipe $.webpack myConfig, null, (err, stats) ->
    if err?
      throw new $.util.PluginError "build:webpack", err
    $.util.log "[build:webpack]", stats.toString({
      colors: true
    })
  .pipe gulp.dest settings.js.dist

# src内のファイルを対象に、distディレクトリにjadeをコンパイルします
gulp.task "build:jade", ->
  gulp.src settings.html.src
  .pipe $.plumber()
  .pipe $.jade()
  .pipe gulp.dest settings.html.dist

gulp.task "build", ["build:webpack", "build:jade"]

gulp.task "build:minify", ["build:webpack:minify", "build:jade"]
