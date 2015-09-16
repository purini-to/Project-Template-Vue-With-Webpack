"use strict"

# 出力先ディレクトリ
dist = "./app"
# ソースディレクトリ
src = "./src"

module.exports = {
  # 出力先を指定
  dist: dist
  # ソース
  src: src

  # coffeeビルドの設定
  js:
    src: "#{src}/js/**"
    dist: "#{dist}/build"
    uglify: false

  # stylusビルドの設定
  css:
    src: "#{src}/css/**/!(_)*"
    dist: "#{dist}/css"
    output: "app.css"
    autoprefixer:
      browsers: ["last 2 versions"]
    minify: false

  # htmlのビルド設定
  html:
    src: "#{src}/html/**/*.jade"
    dist: dist

  # その他の必要なファイル（画像等）
  assets:
    src: "#{src}/assets/**"
    dist: "#{dist}/assets"

  # watchタスクの監視対象を指定
  watch:
    webpack: [
      "#{src}/**/*.coffee"
      "#{src}/**/*.vue"
    ]
    jade: "#{src}/**/*.jade"
    assets: "#{src}/assets/**"
}
