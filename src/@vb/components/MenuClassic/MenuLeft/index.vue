<template>
  <a-layout-sider
    :width="settings.leftMenuWidth"
    :collapsible="settings.isMobileView ? false : true"
    :collapsed="settings.isMenuCollapsed && !settings.isMobileView"
    :class="{
      [$style.menu]: true,
      [$style.white]: settings.menuColor === 'white',
      [$style.gray]: settings.menuColor === 'gray',
      [$style.dark]: settings.menuColor === 'dark',
      [$style.unfixed]: settings.isMenuUnfixed,
      [$style.shadow]: settings.isMenuShadow,
    }"
    @collapse="onCollapse"
  >
    <div
      :class="$style.menuOuter"
      :style="{
        width:
          settings.isMenuCollapsed && !settings.isMobileView
            ? '80px'
            : settings.leftMenuWidth + 'px',
        height:
          settings.isMobileView || settings.isMenuUnfixed
            ? 'calc(100% - 64px)'
            : 'calc(100% - 110px)',
      }"
    >
      <div :class="$style.logoContainer">
        <div :class="$style.logo">
          <svg
            xmlns="http://www.w3.org/2000/svg"
            viewBox="0 0 24 24"
            version="1.1"
            height="24px"
            width="24px"
          >
            <g>
              <path
                fill="#4b7cf3"
                strokeWidth="1"
                stroke="#4b7cf3"
                d="M12,10.9c-0.1,0-0.2,0-0.2-0.1L3.5,6.1C3.4,6,3.3,5.8,3.3,5.6c0-0.2,0.1-0.3,0.2-0.4l8.2-4.7c0.2-0.1,0.3-0.1,0.5,0      l8.2,4.7c0.2,0.1,0.2,0.3,0.2,0.4S20.6,6,20.5,6.1l-8.2,4.7C12.2,10.8,12.1,10.9,12,10.9z M4.8,5.6L12,9.8l7.2-4.2L12,1.5      L4.8,5.6z"
              />
              <path
                fill="#4b7cf3"
                strokeWidth="1"
                stroke="#4b7cf3"
                d="M13.6,23.6c-0.1,0-0.2,0-0.2-0.1c-0.2-0.1-0.2-0.3-0.2-0.4v-9.5c0-0.2,0.1-0.3,0.2-0.4l8.2-4.7c0.2-0.1,0.3-0.1,0.5,0      c0.2,0.1,0.2,0.3,0.2,0.4v9.5c0,0.2-0.1,0.3-0.3,0.4l-8.2,4.7C13.8,23.6,13.7,23.6,13.6,23.6z M14.1,13.9v8.3l7.2-4.2V9.8      L14.1,13.9z"
              />
              <path
                fill="#4b7cf3"
                strokeWidth="1"
                stroke="#4b7cf3"
                d="M10.4,23.6c-0.1,0-0.2,0-0.2-0.1l-8.2-4.7c-0.2-0.1-0.3-0.3-0.3-0.4V8.9c0-0.2,0.1-0.3,0.2-0.4c0.2-0.1,0.3-0.1,0.5,0      l8.2,4.7c0.2,0.1,0.2,0.3,0.2,0.4v9.5c0,0.2-0.1,0.3-0.2,0.4C10.5,23.6,10.5,23.6,10.4,23.6z M2.7,18.1l7.2,4.2v-8.3L2.7,9.8      V18.1z"
              />
            </g>
          </svg>
          <div :class="$style.name">{{ settings.logo }}</div>
          <div :class="$style.descr" class="text-capitalize">
            {{ settings.version }}
          </div>
        </div>
      </div>
      <perfect-scrollbar :style="{ height: '100%' }">
        <a-menu
          v-model:open-keys="openKeys"
          :inline-collapsed="settings.isMobileView ? false : settings.isMenuCollapsed"
          :mode="'inline'"
          :selected-keys="selectedKeys"
          :inline-indent="15"
          :class="$style.navigation"
          @click="handleClick"
          @openChange="handleOpenChange"
        >
          <template v-for="(item, index) in menuData">
            <template v-if="!item.roles || item.roles.includes(user.role)">
              <a-menu-item-group v-if="item.category" :key="index">
                <template #title>
                  {{ item.title }}
                </template>
              </a-menu-item-group>
              <item
                v-if="!item.children && !item.category"
                :key="item.key"
                :menu-info="item"
                :styles="$style"
              />
              <sub-menu v-if="item.children" :key="item.key" :menu-info="item" :styles="$style" />
            </template>
          </template>
        </a-menu>
        <div :class="$style.banner">
          <p>More components, more style, more themes, and premium support!</p>
          <a
            href="https://themeforest.net/item/clean-ui-react-admin-template/21938700"
            target="_blank"
            rel="noopener noreferrer"
            class="btn btn-sm btn-success btn-rounded px-3"
            >Buy Bundle</a
          >
        </div>
      </perfect-scrollbar>
    </div>
  </a-layout-sider>
</template>

<script>
import { ref, onMounted, computed, watch } from 'vue'
import { useStore } from 'vuex'
import { useRoute } from 'vue-router'
import { default as localStore } from 'store'
import find from 'lodash/find'
import { getMenuData } from '@/services/menu'
import SubMenu from './partials/submenu'
import Item from './partials/item'

export default {
  name: 'MenuLeft',
  components: { SubMenu, Item },
  setup() {
    const store = useStore()
    const route = useRoute()
    const menuData = computed(() => getMenuData)
    const selectedKeys = ref([])
    const openKeys = ref([])
    const settings = computed(() => store.getters.settings)
    const isMenuCollapsed = computed(() => store.getters.settings.isMenuCollapsed)
    const user = computed(() => store.getters['user/user'])
    const pathname = computed(() => route.pathname)

    const onCollapse = (collapsed, type) => {
      const value = !settings.value.isMenuCollapsed
      store.commit('CHANGE_SETTING', { setting: 'isMenuCollapsed', value })
    }

    const handleClick = e => {
      if (e.key === 'settings') {
        store.commit('CHANGE_SETTING', {
          setting: 'isSettingsOpen',
          value: true,
        })
        return
      }
      localStore.set('app.menu.selectedKeys', [e.key])
      selectedKeys.value = [e.key]
    }

    const handleOpenChange = openKeys => {
      localStore.set('app.menu.openedKeys', openKeys)
      openKeys.value = openKeys
    }

    const setSelectedKeys = () => {
      const flattenItems = (items, key) =>
        items.reduce((flattenedItems, item) => {
          flattenedItems.push(item)
          if (Array.isArray(item[key])) {
            return flattenedItems.concat(flattenItems(item[key], key))
          }
          return flattenedItems
        }, [])
      const selectedItem = find(flattenItems(menuData.value.concat(), 'children'), [
        'url',
        pathname,
      ])
      selectedKeys.value = selectedItem ? [selectedItem.key] : []
    }

    onMounted(() => {
      openKeys.value = localStore.get('app.menu.openedKeys') || []
      selectedKeys.value = localStore.get('app.menu.selectedKeys') || []
      setSelectedKeys()
    })

    watch(pathname, () => setSelectedKeys())
    watch(isMenuCollapsed, () => (openKeys.value = []))

    return {
      menuData,
      selectedKeys,
      openKeys,
      settings,
      user,
      onCollapse,
      handleClick,
      handleOpenChange,
    }
  },
}
</script>

<style lang="scss" module>
@import './style.module.scss';
</style>
