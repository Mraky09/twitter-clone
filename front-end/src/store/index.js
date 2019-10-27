import Vue from 'vue';
import Vuex from 'vuex';

import authentication from './modules/authentication';
import tweet from './modules/tweet';

Vue.use(Vuex);

export default new Vuex.Store({
  modules: {
    authentication,
    tweet,
  },
});
