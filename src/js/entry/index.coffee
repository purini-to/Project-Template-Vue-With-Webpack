"use strict"

require "Materialize"
require "../../css/app.styl"

Vue = require "vue"
appOptions = require "../components/app.vue"

app = new Vue(appOptions).$mount('#app')
