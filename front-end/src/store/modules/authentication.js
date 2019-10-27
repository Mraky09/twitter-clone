import axios from 'axios';
import {
  AUTH_REQUEST, AUTH_SUCCESS,
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
        auth.setToken(token);

        commit(AUTH_SUCCESS, token);
        // you have your token, now log in your user :)
        // dispatch(USER_REQUEST);
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
  [AUTH_SUCCESS]: (state, token) => {
    state.token = token;
  },
};

export default {
  state: initialState,
  actions,
  mutations,
  getters,
};
