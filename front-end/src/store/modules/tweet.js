import axios from 'axios';
import {
  CREATE_TWEET,
  APPEND_TWEET,
} from '../actions/tweet';

const initalState = {
  tweets: [],
};

const actions = {
  [CREATE_TWEET]: ({ commit }, tweet) => new Promise((resolve, reject) => {
    console.log(tweet);
    axios({
      url: 'http://localhost:4000/api/tweets',
      data: {
        tweet,
      },
      method: 'POST',
    })
      .then(({ data }) => {
        const { createdTweet } = data.data;

        commit(APPEND_TWEET, createdTweet);
        resolve(tweet);
      })
      .catch((error) => {
        console.log(error);
        reject(error);
      });
  }),
};

const mutations = {
  [APPEND_TWEET]: (state, tweet) => {
    const prevTweets = state.tweets;
    state.tweets = prevTweets.push(tweet);
  },
};

export default {
  state: initalState,
  actions,
  mutations,
};
