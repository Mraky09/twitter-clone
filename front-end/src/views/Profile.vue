<template>
  <div class="row">
    <h1>{{`${viewingUserProfile.first_name} ${viewingUserProfile.last_name} `}}</h1>
    <h3 class="subtitle">{{`@${viewingUserProfile.user_name}`}}</h3>
  </div>
</template>
<script>
import {FETCH_USER_PROFILE} from "../store/action.types"
import { mapState } from 'vuex'

export default {
  computed: mapState({viewingUserProfile: state => state.user.viewingUserProfile}),
  mounted() {
    this.$store.dispatch(FETCH_USER_PROFILE, this.$route.params.userName)
  }
};
</script>
