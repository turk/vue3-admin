<template>
  <div>
    <div class="h-100 pt-5 pb-5 text-center">
      <i class="fe fe-users font-size-50" />
    </div>
    <div class="d-flex mb-1">
      <div class="text-uppercase font-weight-bold text-dark mr-auto">
        New users
      </div>
      <div>+20% Goal Reached</div>
    </div>
    <div class="d-flex mb-2">
      <div class="font-size-24 font-weight-bold text-success mr-auto">
        +3,125
      </div>
      <div class="font-size-24 text-gray-4">
        5,000
      </div>
    </div>
    <div class="progress">
      <div
        class="progress-bar bg-success"
        style="width: 60%"
        role="progressbar"
        aria-valuenow="60"
        aria-valuemin="0"
        aria-valuemax="100"
      />
    </div>
  </div>
</template>
<script>
export default {
  name: 'VbGeneral12v2',
}
</script>
