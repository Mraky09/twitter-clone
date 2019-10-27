import axios from 'axios';
import {
  AUTH_REQUEST,
  SET_AUTH,
} from '../actions/auth';
import auth from '../../utils/auth';

const initialState = { token: auth.getToken() };

const getters = {
  isAuthenticated: state => !!state.token,
};

const actions = {
  [AUTH_REQUEST]: ({ commit }, user) => new Promise((resolve, reject) => {
    axios({ url: 'http://localhost:4000/sessions/sign_in', data: user, method: 'POST' })
      .then(({ data }) => {
        const { token } = data.data;
        auth.setToken(token, true);

        commit(SET_AUTH, token);
        // you have your token, now log in your user :)
        // dispatch(USER_REQUEST);
        axios.defaults.headers.common.Authorization = `Bearer ${token}`;
        resolve(data);
      })
      .catch((error) => {
        console.log(error);
        auth.clearToken();
        reject(error);
      });
  }),
};

const mutations = {
  [SET_AUTH]: (state, token) => {
    state.token = token;
  },
};

export default {
  state: initialState,
  actions,
  mutations,
  getters,
};
