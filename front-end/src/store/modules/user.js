import axios from 'axios';
import {
  FETCH_USER_PROFILE
} from '../action.types';

import {
  SET_VIEWING_USER_PROFILE
} from '../mutation.types';


const initalState = {
  viewingUserProfile: {},
};

const actions = {
  [FETCH_USER_PROFILE]: ({ commit }, userName) => new Promise((resolve, reject) => {

    axios({
      url: `http://localhost:4000/api/users/${userName}`,
      method: 'GET',
    })
      .then(({ data }) => {
        const { user } = data.data;

        commit(SET_VIEWING_USER_PROFILE, user);
        resolve(user);
      })
      .catch((error) => {
        console.log(error);
        reject(error);
      });
  }),
};

const mutations = {
  [SET_VIEWING_USER_PROFILE]: (state, viewingUserProfile) => {
    state.viewingUserProfile = viewingUserProfile;
  },
};

export default {
  state: initalState,
  actions,
  mutations,
};
