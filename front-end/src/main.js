import 'bootstrap/dist/css/bootstrap.css';
import 'bootstrap-vue/dist/bootstrap-vue.css';
import Vue from 'vue';
import BootstrapVue from 'bootstrap-vue';
import axios from 'axios';
import App from './App.vue';
import router from './router';
import store from './store';
import auth from './utils/auth';

Vue.config.productionTip = false;
Vue.use(BootstrapVue);

const token = auth.getToken();

if (token) {
  axios.defaults.headers.common.Authorization = token;
}

new Vue({
  router,
  store,
  render: h => h(App),
}).$mount('#app');
