import Vue from 'vue';
import Vuex from 'vuex';

import authentication from './modules/authentication';
import tweet from './modules/tweet';
import user from './modules/user';

Vue.use(Vuex);

export default new Vuex.Store({
  modules: {
    authentication,
    tweet,
    user
  },
});
