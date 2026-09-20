<template>
  <div class="login-form-heading">
    <h2>{{ getFormTitle }}</h2>
    <p>{{ getFormDescription }}</p>
  </div>
</template>
<script lang="ts" setup>
import { LoginStateEnum, useLoginState } from './useLogin'

defineOptions({ name: 'LoginFormTitle' })

const { t } = useI18n()

const { getLoginState } = useLoginState()

const getFormTitle = computed(() => {
  const titleObj = {
    [LoginStateEnum.RESET_PASSWORD]: t('sys.login.forgetFormTitle'),
    [LoginStateEnum.LOGIN]: t('sys.login.signInFormTitle'),
    [LoginStateEnum.REGISTER]: t('sys.login.signUpFormTitle'),
    [LoginStateEnum.MOBILE]: t('sys.login.mobileSignInFormTitle'),
    [LoginStateEnum.QR_CODE]: t('sys.login.qrSignInFormTitle'),
    [LoginStateEnum.SSO]: t('sys.login.ssoFormTitle')
  }
  return titleObj[unref(getLoginState)]
})

const getFormDescription = computed(() =>
  unref(getLoginState) === LoginStateEnum.LOGIN
    ? '使用您的工作账号继续'
    : '验证账号后重置登录密码'
)
</script>

<style lang="scss" scoped>
.login-form-heading {
  width: 100%;
  margin-bottom: 18px;

  h2 {
    margin: 0;
    font-size: 32px;
    font-weight: 650;
    letter-spacing: -0.04em;
    color: var(--login-text, var(--el-text-color-primary));
  }

  p {
    margin: 10px 0 0;
    font-size: 14px;
    color: var(--login-muted, var(--el-text-color-secondary));
  }
}
</style>
