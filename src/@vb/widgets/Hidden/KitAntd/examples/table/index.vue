<template>
  <div>
    <h5 class="mb-3">
      <strong>Table Component Preview</strong>
    </h5>
    <div class="mb-5">
      <a-table :columns="columns" :data-source="data">
        <template #name="{ text }">
          <a href="javascript:;">{{ text }}</a>
        </template>
        <template #customTitle>
          <span> <a-icon type="smile-o" />Name </span>
        </template>

        <template #tags="{ text: tags }">
          <span>
            <a-tag v-for="tag in tags" color="blue" :key="tag">{{ tag }}</a-tag>
          </span>
        </template>
        <template #action="{ record }">
          <span>
            <a href="javascript:;">Invite 一 {{ record.name }}</a>
            <a-divider type="vertical" />
            <a href="javascript:;">Delete</a>
            <a-divider type="vertical" />
            <a href="javascript:;" class="ant-dropdown-link">
              More actions
              <a-icon type="down" />
            </a>
          </span>
        </template>
      </a-table>
    </div>
  </div>
</template>
<script>
const columns = [
  {
    dataIndex: 'name',
    key: 'name',
    slots: { title: 'customTitle' },
    scopedSlots: { customRender: 'name' },
  },
  {
    title: 'Age',
    dataIndex: 'age',
    key: 'age',
  },
  {
    title: 'Address',
    dataIndex: 'address',
    key: 'address',
  },
  {
    title: 'Tags',
    key: 'tags',
    dataIndex: 'tags',
    scopedSlots: { customRender: 'tags' },
  },
  {
    title: 'Action',
    key: 'action',
    scopedSlots: { customRender: 'action' },
  },
]

const data = [
  {
    key: '1',
    name: 'John Brown',
    age: 32,
    address: 'New York No. 1 Lake Park',
    tags: ['nice', 'developer'],
  },
  {
    key: '2',
    name: 'Jim Green',
    age: 42,
    address: 'London No. 1 Lake Park',
    tags: ['loser'],
  },
  {
    key: '3',
    name: 'Joe Black',
    age: 32,
    address: 'Sidney No. 1 Lake Park',
    tags: ['cool', 'teacher'],
  },
]

export default {
  name: 'KitAntdTableExample',
  data() {
    return {
      data,
      columns,
    }
  },
}
</script>
