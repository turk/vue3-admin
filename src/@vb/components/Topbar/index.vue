<template>
  <div :class="$style.topbar">
    <div class="mr-4">
      <vb-fav-pages />
    </div>
    <div class="mr-auto mr-md-1">
      <vb-search />
    </div>
    <div class="mr-4 d-none d-md-block">
      <vb-issues-history />
    </div>
    <div class="mr-auto d-xl-block d-none">
      <vb-project-management />
    </div>
    <div class="mr-3 d-none d-sm-block ml-auto">
      <vb-cart />
    </div>
    <div class="mr-3 d-none d-sm-block">
      <vb-actions />
    </div>
    <div class="mr-3 d-none d-sm-block">
      <vb-language-switcher />
    </div>
    <div>
      <vb-user-menu />
    </div>
  </div>
</template>

<script>
import VbIssuesHistory from './IssuesHistory'
import VbProjectManagement from './ProjectManagement'
import VbSearch from './Search'
import VbLanguageSwitcher from './LanguageSwitcher'
import VbActions from './Actions'
import VbUserMenu from './UserMenu'
import VbFavPages from './FavPages'
import VbCart from './Cart'

export default {
  components: {
    VbIssuesHistory,
    VbProjectManagement,
    VbSearch,
    VbLanguageSwitcher,
    VbActions,
    VbUserMenu,
    VbFavPages,
    VbCart,
  },
}
</script>

<style lang="scss" module>
@import './style.module.scss';
</style>
