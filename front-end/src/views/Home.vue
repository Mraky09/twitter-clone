<template>
  <form @submit.prevent="submit">
    <div class="form-group">
      <textarea
        type="text"
        v-model="tweet.content"
        placeholder="What's happening?"
        class="form-control form-control-lg"
      />
    </div>
    <button class="btn btn-primary">Tweet</button>
  </form>
</template>

<script>
import { CREATE_TWEET } from '../store/actions/tweet';

export default {
  name: 'home',
  data() {
    return {
      tweet: {
        content: '',
      },
    };
  },
  methods: {
    submit() {
      this.$store.dispatch(CREATE_TWEET, this.tweet);
    },
  },
  components: {},
};
</script>
