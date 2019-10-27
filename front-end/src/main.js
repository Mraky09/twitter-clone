import 'bootstrap/dist/css/bootstrap.css';
import 'bootstrap-vue/dist/bootstrap-vue.css';
import Vue from 'vue';
import BootstrapVue from 'bootstrap-vue';
import Axios from 'axios';
import App from './App.vue';
import router from './router';
import store from './store';
import auth from './utils/auth';

Vue.config.productionTip = false;
Vue.use(BootstrapVue);
Vue.prototype.$http = Axios;

const token = auth.getToken();

if (token) {
  Vue.prototype.$http.defaults.headers.common.Authorization = `Bearer ${token}`;
}

new Vue({
  router,
  store,
  render: h => h(App),
}).$mount('#app');
