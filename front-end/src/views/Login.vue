<template>
  <div class="card">
    <article class="card-body">
      <a href class="float-right btn btn-outline-primary">Sign up</a>
      <h4 class="card-title mb-4 mt-1">Sign in</h4>
      <form @submit.prevent="signIn">
        <div class="form-group">
          <label>Your email</label>
          <input
            v-model="email"
            class="form-control"
            placeholder="Email"
            type="email"
            required
          />
        </div>
        <!-- form-group// -->
        <div class="form-group">
          <a class="float-right" href="#">Forgot?</a>
          <label>Your password</label>
          <input v-model="password" class="form-control" type="password" required />
        </div>
        <!-- form-group// -->
        <div class="form-group">
          <button type="submit" class="btn btn-primary btn-block">Login</button>
        </div>
        <!-- form-group// -->
      </form>
    </article>
  </div>
  <!-- card.// -->
</template>
<script>
import { AUTH_REQUEST } from '../store/actions/auth';

export default {
  data() {
    return {
      email: '',
      password: '',
    };
  },
  methods: {
    signIn() {
      const { email, password } = this;

      this.$store.dispatch(AUTH_REQUEST, { email, password }).then(() => {
        this.$router.push('/');
      });
    },
  },
};
</script>
