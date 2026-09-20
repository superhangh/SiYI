<template>
  <div :class="prefixCls" class="siyi-login-page">
    <div class="login-shell">
      <aside class="login-context">
        <div class="brand">
          <img src="/siyi-logo.svg" alt="司易管理系统" class="brand__logo" />
          <div>
            <div class="brand__name">{{ appStore.getTitle }}</div>
            <div class="brand__description">企业业务协同平台</div>
          </div>
        </div>

        <div class="context-content">
          <div class="context-status"><span></span> 系统运行正常</div>
          <h1>一套系统，<br />管好每一次流转</h1>
          <p>从订单到交付，让业务信息沿着同一条路径准确抵达。</p>

          <div class="process-board" aria-label="销售、生产、仓储和财务业务流转">
            <div class="process-board__title">核心业务流转</div>
            <ol>
              <li>
                <span>01</span>
                <div><strong>销售订单</strong><small>需求进入</small></div>
              </li>
              <li>
                <span>02</span>
                <div><strong>生产计划</strong><small>资源排程</small></div>
              </li>
              <li>
                <span>03</span>
                <div><strong>仓储履约</strong><small>收发协同</small></div>
              </li>
              <li>
                <span>04</span>
                <div><strong>财务结算</strong><small>数据闭环</small></div>
              </li>
            </ol>
          </div>
        </div>

        <div class="context-footer">
          <span>司易科技</span>
          <span>2026</span>
        </div>
      </aside>

      <section class="login-panel">
        <header class="panel-header">
          <div class="mobile-brand">
            <img src="/siyi-logo.svg" alt="司易管理系统" />
            <div>
              <strong>{{ appStore.getTitle }}</strong>
              <span>企业业务协同平台</span>
            </div>
          </div>
          <div class="panel-actions">
            <ThemeSwitch />
            <LocaleDropdown />
          </div>
        </header>

        <main class="form-zone">
          <div class="form-wrap">
            <LoginForm />
            <ForgetPasswordForm />
          </div>
        </main>

        <footer class="panel-footer">需要帮助？请联系系统管理员</footer>
      </section>
    </div>
  </div>
</template>
<script lang="ts" setup>
import { useDesign } from '@/hooks/web/useDesign'
import { useAppStore } from '@/store/modules/app'
import { ThemeSwitch } from '@/layout/components/ThemeSwitch'
import { LocaleDropdown } from '@/layout/components/LocaleDropdown'

import { LoginForm, ForgetPasswordForm } from './components'

defineOptions({ name: 'Login' })

const appStore = useAppStore()
const { getPrefixCls } = useDesign()
const prefixCls = getPrefixCls('login')
</script>

<style lang="scss" scoped>
.siyi-login-page {
  --login-page-bg: #edf2ff;
  --login-panel-bg: rgb(255 255 255 / 82%);
  --login-card-bg: rgb(255 255 255 / 88%);
  --login-card-border: rgb(255 255 255 / 72%);
  --login-text: #17213b;
  --login-muted: #7b849c;

  position: relative;
  min-height: 100%;
  overflow: hidden;
  overflow: clip;
  color: var(--login-text);
  background: var(--login-page-bg);
}

.login-glow {
  position: absolute;
  pointer-events: none;
  border-radius: 999px;
  filter: blur(2px);

  &--one {
    top: -18%;
    right: 20%;
    width: 480px;
    height: 480px;
    background: rgb(91 140 255 / 16%);
  }

  &--two {
    right: -10%;
    bottom: -22%;
    width: 520px;
    height: 520px;
    background: rgb(123 77 219 / 13%);
  }
}

.login-shell {
  position: relative;
  z-index: 1;
  display: grid;
  grid-template-columns: minmax(480px, 1.06fr) minmax(460px, 0.94fr);
  min-height: 100vh;
}

.login-hero {
  position: relative;
  display: flex;
  padding: clamp(32px, 4.5vw, 68px);
  overflow: hidden;
  color: #fff;
  flex-direction: column;
  background:
    radial-gradient(circle at 76% 18%, rgb(133 159 255 / 28%), transparent 25%),
    radial-gradient(circle at 15% 85%, rgb(122 86 229 / 30%), transparent 30%),
    linear-gradient(145deg, #101b3f 0%, #243a88 54%, #4d3fa5 100%);

  &::before,
  &::after {
    position: absolute;
    border: 1px solid rgb(255 255 255 / 12%);
    border-radius: 50%;
    content: '';
  }

  &::before {
    top: 13%;
    right: -18%;
    width: 440px;
    height: 440px;
    box-shadow: 0 0 0 54px rgb(255 255 255 / 3%), 0 0 0 108px rgb(255 255 255 / 2%);
  }

  &::after {
    bottom: -150px;
    left: -100px;
    width: 360px;
    height: 360px;
    background: linear-gradient(135deg, rgb(255 255 255 / 8%), transparent 60%);
  }
}

.brand,
.mobile-brand {
  position: relative;
  z-index: 1;
  display: flex;
  align-items: center;
}

.brand__logo {
  width: 52px;
  height: 52px;
  margin-right: 14px;
}

.brand__name {
  font-size: 21px;
  font-weight: 700;
  letter-spacing: 0.04em;
}

.brand__en {
  margin-top: 3px;
  font-size: 10px;
  font-weight: 600;
  letter-spacing: 0.22em;
  color: rgb(255 255 255 / 55%);
}

.hero-content {
  position: relative;
  z-index: 1;
  width: min(560px, 90%);
  margin: auto 0;
}

.hero-badge {
  display: inline-flex;
  padding: 8px 14px;
  font-size: 13px;
  color: rgb(255 255 255 / 78%);
  background: rgb(255 255 255 / 8%);
  border: 1px solid rgb(255 255 255 / 15%);
  border-radius: 999px;
  align-items: center;
  backdrop-filter: blur(10px);

  span {
    width: 7px;
    height: 7px;
    margin-right: 9px;
    background: #78e8bd;
    border-radius: 50%;
    box-shadow: 0 0 0 5px rgb(120 232 189 / 12%);
  }
}

.hero-content h1 {
  margin: 26px 0 18px;
  font-size: clamp(42px, 4.2vw, 64px);
  font-weight: 700;
  line-height: 1.2;
  letter-spacing: -0.035em;

  em {
    font-style: normal;
    color: #a9c5ff;
  }
}

.hero-content > p {
  max-width: 480px;
  margin: 0;
  font-size: 16px;
  line-height: 1.9;
  color: rgb(255 255 255 / 66%);
}

.hero-features {
  display: flex;
  gap: 12px;
  margin-top: 38px;
}

.hero-feature {
  display: flex;
  min-width: 104px;
  padding: 14px 16px;
  background: rgb(255 255 255 / 7%);
  border: 1px solid rgb(255 255 255 / 10%);
  border-radius: 14px;
  flex-direction: column;
  backdrop-filter: blur(10px);

  strong {
    margin-bottom: 3px;
    font-size: 16px;
  }

  span {
    font-size: 12px;
    color: rgb(255 255 255 / 53%);
  }
}

.hero-footer {
  position: relative;
  z-index: 1;
  font-size: 12px;
  letter-spacing: 0.04em;
  color: rgb(255 255 255 / 34%);
}

.login-panel {
  display: flex;
  min-width: 0;
  padding: 28px clamp(24px, 4vw, 62px);
  flex-direction: column;
  background: var(--login-panel-bg);
  backdrop-filter: blur(24px);
}

.panel-header {
  display: flex;
  min-height: 48px;
  align-items: center;
  justify-content: flex-end;
}

.mobile-brand {
  display: none;

  img {
    width: 44px;
    height: 44px;
    margin-right: 11px;
  }

  div {
    display: flex;
    flex-direction: column;
  }

  strong {
    font-size: 17px;
    color: var(--login-text);
  }

  span {
    margin-top: 2px;
    font-size: 8px;
    font-weight: 600;
    letter-spacing: 0.18em;
    color: var(--login-muted);
  }
}

.panel-actions {
  display: flex;
  height: 44px;
  padding: 0 10px;
  color: var(--login-text);
  background: var(--login-card-bg);
  border: 1px solid rgb(130 143 175 / 14%);
  border-radius: 14px;
  box-shadow: 0 8px 30px rgb(38 51 103 / 7%);
  align-items: center;
  gap: 8px;
}

.form-zone {
  display: flex;
  width: 100%;
  flex: 1;
  align-items: center;
  justify-content: center;
}

.login-card {
  width: min(100%, 460px);
  padding: clamp(30px, 4vw, 48px);
  background: var(--login-card-bg);
  border: 1px solid var(--login-card-border);
  border-radius: 28px;
  box-shadow: 0 28px 80px rgb(38 51 103 / 14%);
  backdrop-filter: blur(18px);
}

.panel-footer {
  font-size: 12px;
  color: var(--login-muted);
  text-align: center;
}

:global(.dark) .siyi-login-page {
  --login-page-bg: #11172a;
  --login-panel-bg: rgb(17 23 42 / 88%);
  --login-card-bg: rgb(27 35 59 / 84%);
  --login-card-border: rgb(129 147 194 / 15%);
  --login-text: #eef3ff;
  --login-muted: #8995b2;
}

@media (width <= 1080px) {
  .login-shell {
    display: block;
  }

  .login-hero {
    display: none;
  }

  .login-panel {
    min-height: 100vh;
  }

  .panel-header {
    justify-content: space-between;
  }

  .mobile-brand {
    display: flex;
  }
}

@media (width <= 600px) {
  .login-panel {
    padding: 20px 16px;
  }

  .login-card {
    padding: 28px 22px;
    border-radius: 22px;
  }

  .mobile-brand span {
    display: none;
  }
}

/* 业务流转主题：用清晰的信息结构代替装饰性卡片与渐变堆叠 */
.siyi-login-page {
  --login-page-bg: #f6f8fc;
  --login-panel-bg: #f6f8fc;
  --login-text: #14213d;
  --login-muted: #68738a;

  font-family: 'Microsoft YaHei', 'PingFang SC', 'Noto Sans SC', sans-serif;
  background: var(--login-page-bg);
}

.login-shell {
  grid-template-columns: minmax(560px, 1.12fr) minmax(460px, 0.88fr);
}

.login-context {
  position: relative;
  display: flex;
  min-height: 100vh;
  padding: clamp(38px, 4.6vw, 68px);
  overflow: hidden;
  color: #fff;
  flex-direction: column;
  background-color: #14213d;
  background-image:
    linear-gradient(rgb(255 255 255 / 4%) 1px, transparent 1px),
    linear-gradient(90deg, rgb(255 255 255 / 4%) 1px, transparent 1px);
  background-size: 48px 48px;

  &::after {
    position: absolute;
    top: -150px;
    right: -170px;
    width: 460px;
    height: 460px;
    border: 82px solid rgb(47 91 206 / 18%);
    border-radius: 50%;
    content: '';
  }
}

.brand__description {
  margin-top: 4px;
  font-size: 12px;
  letter-spacing: 0.08em;
  color: rgb(255 255 255 / 52%);
}

.context-content {
  position: relative;
  z-index: 1;
  width: min(620px, 100%);
  margin: auto 0;
}

.context-status {
  display: inline-flex;
  font-size: 13px;
  color: rgb(255 255 255 / 68%);
  align-items: center;

  span {
    width: 8px;
    height: 8px;
    margin-right: 10px;
    background: #32b38c;
    border-radius: 50%;
    box-shadow: 0 0 0 5px rgb(50 179 140 / 13%);
  }
}

.context-content h1 {
  max-width: 580px;
  margin: 24px 0 18px;
  font-size: clamp(44px, 4.7vw, 68px);
  font-weight: 650;
  line-height: 1.18;
  letter-spacing: -0.055em;
}

.context-content > p {
  max-width: 500px;
  margin: 0;
  font-size: 16px;
  line-height: 1.8;
  color: rgb(255 255 255 / 62%);
}

.process-board {
  padding: 22px 0 0;
  margin-top: 42px;
  border-top: 1px solid rgb(255 255 255 / 14%);
}

.process-board__title {
  margin-bottom: 18px;
  font-size: 12px;
  color: rgb(255 255 255 / 46%);
}

.process-board ol {
  display: grid;
  padding: 0;
  margin: 0;
  list-style: none;
  grid-template-columns: repeat(4, 1fr);
}

.process-board li {
  position: relative;
  display: flex;
  min-width: 0;
  align-items: flex-start;

  &:not(:last-child)::after {
    position: absolute;
    top: 12px;
    right: 10px;
    width: 22px;
    height: 1px;
    background: rgb(255 255 255 / 24%);
    content: '';
  }

  > span {
    margin-right: 10px;
    font-size: 11px;
    font-weight: 700;
    color: #7fa0f4;
  }

  div {
    display: flex;
    min-width: 0;
    flex-direction: column;
  }

  strong {
    margin-bottom: 5px;
    font-size: 14px;
    font-weight: 600;
    white-space: nowrap;
  }

  small {
    font-size: 11px;
    color: rgb(255 255 255 / 38%);
  }
}

.context-footer {
  position: relative;
  z-index: 1;
  display: flex;
  font-size: 12px;
  color: rgb(255 255 255 / 30%);
  justify-content: space-between;
}

.login-panel {
  padding: 34px clamp(34px, 5vw, 76px);
  background: var(--login-panel-bg);
  backdrop-filter: none;
}

.panel-header {
  min-height: 42px;
}

.panel-actions {
  height: 40px;
  padding: 0 8px;
  background: #fff;
  border-color: #dce2ec;
  border-radius: 10px;
  box-shadow: none;
}

.form-zone {
  animation: form-enter 420ms cubic-bezier(0.22, 1, 0.36, 1) both;
}

.form-wrap {
  width: min(100%, 408px);
}

.panel-footer {
  font-size: 12px;
  color: #8a94a8;
}

.form-wrap :deep(.login-form) {
  width: 100%;
}

.form-wrap :deep(.el-form-item) {
  margin-bottom: 22px;
}

.form-wrap :deep(.el-form-item__label) {
  height: auto;
  margin-bottom: 8px;
  font-size: 13px;
  font-weight: 600;
  line-height: 1.5;
  color: var(--login-text);
}

.form-wrap :deep(.el-input__wrapper) {
  min-height: 48px;
  padding: 0 15px;
  background: #fff;
  border: 1px solid #dce2ec;
  border-radius: 10px;
  box-shadow: none;
  transition: border-color 160ms ease, box-shadow 160ms ease;
}

.form-wrap :deep(.el-input__wrapper:hover) {
  border-color: #aeb9ce;
}

.form-wrap :deep(.el-input__wrapper.is-focus) {
  border-color: #2f5bce;
  box-shadow: 0 0 0 3px rgb(47 91 206 / 10%);
}

.form-wrap :deep(.el-button--primary) {
  min-height: 48px;
  font-weight: 600;
  letter-spacing: 0;
  color: #fff;
  background: #2f5bce;
  border: 1px solid #2f5bce;
  border-radius: 10px;
  box-shadow: none;
  transition: background-color 160ms ease, border-color 160ms ease;
}

.form-wrap :deep(.el-button--primary:hover),
.form-wrap :deep(.el-button--primary:focus-visible) {
  background: #2449ad;
  border-color: #2449ad;
  transform: none;
  box-shadow: 0 0 0 3px rgb(47 91 206 / 13%);
}

.form-wrap :deep(.el-checkbox__label),
.form-wrap :deep(.el-link) {
  font-size: 13px;
}

:global(.dark) .siyi-login-page {
  --login-page-bg: #11182a;
  --login-panel-bg: #11182a;
  --login-text: #edf2ff;
  --login-muted: #97a3bb;
}

:global(.dark) .panel-actions,
:global(.dark) .form-wrap :deep(.el-input__wrapper) {
  background: #182137;
  border-color: #303b53;
}

:global(.dark) .form-wrap :deep(.el-input__wrapper.is-focus) {
  border-color: #6f8fee;
  box-shadow: 0 0 0 3px rgb(111 143 238 / 12%);
}

@keyframes form-enter {
  from {
    opacity: 0;
    transform: translateY(10px);
  }

  to {
    opacity: 1;
    transform: translateY(0);
  }
}

@media (width <= 1080px) {
  .login-shell {
    display: block;
  }

  .login-context {
    display: none;
  }

  .login-panel {
    min-height: 100vh;
    padding: 28px clamp(24px, 7vw, 72px);
  }

  .panel-header {
    justify-content: space-between;
  }

  .mobile-brand {
    display: flex;
  }

  .mobile-brand span {
    display: block;
    letter-spacing: 0.04em;
  }
}

@media (width <= 600px) {
  .login-panel {
    padding: 20px;
  }

  .mobile-brand span {
    display: none;
  }

  .form-wrap {
    width: 100%;
  }
}

@media (prefers-reduced-motion: reduce) {
  .form-zone {
    animation: none;
  }

  .form-wrap :deep(*) {
    scroll-behavior: auto !important;
    transition: none !important;
  }
}
</style>
