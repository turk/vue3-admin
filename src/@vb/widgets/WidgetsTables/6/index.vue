<template>
  <div>
    <div class="mb-2" :class="$style.textDivider">
      <h4 class="font-size-24 font-weight-bold" :class="$style.textDividerContent">
        Waiting actions
      </h4>
    </div>
    <div class="table-responsive text-nowrap">
      <a-table
        :columns="columns"
        :data-source="data"
        :pagination="false"
        :row-selection="{
          selectedRowKeys: selectedRowKeys,
          onChange: onSelectChange,
        }"
      >
        <template #userName="{ text: user }">
          <div>
            <div>{{ user.name }}</div>
            <div class="text-gray-4">
              {{ user.position }}
            </div>
          </div>
        </template>
        <template #location="{ text }">
          <a href="javascript: void(0);" class="text-blue">{{ text }}</a>
        </template>
        <template #value="{ text }">
          <span class="font-weight-bold">{{ text }}</span>
        </template>
        <template #action>
          <div class="text-nowrap">
            <button type="button" class="btn btn-outline-danger mr-2 mb-2">
              Decline
            </button>
          </div>
        </template>
      </a-table>
    </div>
  </div>
</template>
<script>
import data from './data.json'
const columns = [
  {
    title: 'USER NAME',
    dataIndex: 'userName',
    className: 'text-gray-6',
    slots: { customRender: 'userName' },
  },
  {
    title: 'LOCATION',
    dataIndex: 'location',
    className: 'text-gray-6',
    slots: { customRender: 'location' },
  },
  {
    title: 'VALUE',
    dataIndex: 'value',
    key: 'value',
    className: 'text-right text-gray-6',
    slots: { customRender: 'value' },
  },
  {
    dataIndex: 'action',
    className: 'text-right',
    slots: { customRender: 'action' },
  },
]

export default {
  name: 'VbTable6',
  data: function() {
    return {
      columns,
      data,
      selectedRowKeys: [],
    }
  },
  methods: {
    onSelectChange(selectedRowKeys) {
      this.selectedRowKeys = selectedRowKeys
    },
  },
}
</script>
<style lang="scss" module>
@import './style.module.scss';
</style>
