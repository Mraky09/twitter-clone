<template>
  <div id="app">
    <div class="container">
      <div class="row">
        <div class="col-sm">HOME</div>
        <div class="col-sm">
          <router-view />
        </div>
        <div class="col-sm">Sidebar</div>
      </div>
    </div>
  </div>
</template>

<style>
.container {
  margin-top: 45px;
}
.form-control {
  flex-grow: 1;
}
</style>
