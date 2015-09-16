"use strict"

require "../../css/app.styl"

Vue = require "vue"
appOptions = require "../../html/components/app.vue"

app = new Vue(appOptions).$mount('#app')
