<template>
  <main class="home-workspace">
    <section class="welcome-panel" aria-labelledby="welcome-title">
      <div class="welcome-panel__copy">
        <div class="welcome-panel__eyebrow">
          <span class="welcome-panel__eyebrow-line"></span>
          {{ dateLabel }}
        </div>
        <h1 id="welcome-title">{{ greeting }}，欢迎使用司易管理系统</h1>
        <p>聚焦客户经营、流程协作与平台管理，从这里开始今天的工作。</p>
      </div>

      <div class="system-status" aria-label="司易业务工作台">
        <span class="system-status__signal" aria-hidden="true"></span>
        <div>
          <strong>司易业务工作台</strong>
          <small>入口按账号权限开放</small>
        </div>
      </div>
    </section>

    <section class="content-panel flow-panel" aria-labelledby="flow-title">
      <header class="section-heading">
        <div>
          <span class="section-heading__index">01</span>
          <h2 id="flow-title">工作导航</h2>
        </div>
        <p>当前系统核心工作区域</p>
      </header>

      <div class="business-flow">
        <button
          v-for="(stage, index) in businessStages"
          :key="stage.routeName"
          class="flow-stage"
          type="button"
          @click="openModule(stage.routeName)"
        >
          <span class="flow-stage__number">{{ String(index + 1).padStart(2, '0') }}</span>
          <span class="flow-stage__icon" :class="`flow-stage__icon--${stage.tone}`">
            <Icon :icon="stage.icon" :size="22" />
          </span>
          <span class="flow-stage__copy">
            <strong>{{ stage.title }}</strong>
            <small>{{ stage.description }}</small>
          </span>
          <span v-if="index < businessStages.length - 1" class="flow-stage__connector"></span>
        </button>
      </div>
    </section>

    <div class="workspace-grid">
      <section class="content-panel module-panel" aria-labelledby="module-title">
        <header class="section-heading section-heading--compact">
          <div>
            <span class="section-heading__index">02</span>
            <h2 id="module-title">常用工作</h2>
          </div>
          <p>按业务场景快速进入对应工作台</p>
        </header>

        <div class="module-list">
          <button
            v-for="module in workModules"
            :key="module.routeName"
            class="module-row"
            type="button"
            @click="openModule(module.routeName)"
          >
            <span class="module-row__icon" :class="`module-row__icon--${module.tone}`">
              <Icon :icon="module.icon" :size="21" />
            </span>
            <span class="module-row__copy">
              <strong>{{ module.title }}</strong>
              <small>{{ module.description }}</small>
            </span>
            <span class="module-row__action">进入工作台</span>
          </button>
        </div>
      </section>

      <aside class="content-panel start-panel" aria-labelledby="start-title">
        <header class="section-heading section-heading--compact">
          <div>
            <span class="section-heading__index">03</span>
            <h2 id="start-title">开始工作</h2>
          </div>
        </header>

        <div class="start-actions">
          <button type="button" class="start-action" @click="openModule('CrmBacklog')">
            <span class="start-action__label">优先处理</span>
            <strong>查看客户待办</strong>
            <Icon icon="ep:check" :size="18" />
          </button>
          <button type="button" class="start-action" @click="openModule('BpmTodoTask')">
            <span class="start-action__label">协同推进</span>
            <strong>处理流程待办</strong>
            <Icon icon="ep:finished" :size="18" />
          </button>
        </div>

        <div class="permission-note">
          <Icon icon="ep:lock" :size="18" />
          <p>
            <strong>入口随权限开放</strong>
            <span>未展示的业务模块，请联系管理员配置访问权限。</span>
          </p>
        </div>
      </aside>
    </div>
  </main>
</template>

<script lang="ts" setup>
import { useRouter } from 'vue-router'

defineOptions({ name: 'Index' })

interface HomeModule {
  title: string
  description: string
  icon: string
  routeName: string
  tone: 'blue' | 'green' | 'orange' | 'violet' | 'slate'
}

const router = useRouter()
const message = useMessage()

const now = new Date()
const dateLabel = new Intl.DateTimeFormat('zh-CN', {
  month: 'long',
  day: 'numeric',
  weekday: 'long'
}).format(now)

const greeting = computed(() => {
  const hour = now.getHours()
  if (hour < 11) return '早上好'
  if (hour < 14) return '中午好'
  if (hour < 18) return '下午好'
  return '晚上好'
})

const businessStages: HomeModule[] = [
  {
    title: '客户关系',
    description: '待办与跟进',
    icon: 'ep:user',
    routeName: 'CrmBacklog',
    tone: 'violet'
  },
  {
    title: '流程协作',
    description: '审批与流转',
    icon: 'ep:finished',
    routeName: 'BpmTodoTask',
    tone: 'blue'
  },
  {
    title: '组织权限',
    description: '用户与角色',
    icon: 'ep:user-filled',
    routeName: 'SystemUser',
    tone: 'green'
  },
  {
    title: '平台运维',
    description: '任务与监控',
    icon: 'ep:monitor',
    routeName: 'InfraJob',
    tone: 'orange'
  }
]

const workModules: HomeModule[] = [
  {
    title: '客户关系',
    description: '集中查看客户待办，推进线索、商机、合同与回款工作',
    icon: 'ep:user',
    routeName: 'CrmBacklog',
    tone: 'violet'
  },
  {
    title: '流程协作',
    description: '处理待办任务并追踪业务审批流程的流转状态',
    icon: 'ep:finished',
    routeName: 'BpmTodoTask',
    tone: 'blue'
  },
  {
    title: '组织与权限',
    description: '维护系统用户、部门、岗位与角色权限配置',
    icon: 'ep:user-filled',
    routeName: 'SystemUser',
    tone: 'green'
  },
  {
    title: '平台运维',
    description: '查看定时任务与基础设施运行配置',
    icon: 'ep:monitor',
    routeName: 'InfraJob',
    tone: 'orange'
  }
]

const openModule = (routeName: string) => {
  if (!router.hasRoute(routeName)) {
    message.warning('当前账号暂无该模块访问权限')
    return
  }
  router.push({ name: routeName })
}
</script>

<style lang="scss" scoped>
.home-workspace {
  --home-ink: #14213d;
  --home-blue: #2f5bce;
  --home-paper: var(--el-bg-color);
  --home-canvas: var(--el-fill-color-extra-light);
  --home-rule: var(--el-border-color-lighter);
  --home-muted: var(--el-text-color-secondary);

  min-height: calc(100vh - 104px);
  padding: 20px;
  font-family: 'Microsoft YaHei', 'PingFang SC', sans-serif;
  color: var(--el-text-color-primary);
  background: var(--home-canvas);
}

.welcome-panel {
  position: relative;
  display: flex;
  align-items: flex-end;
  justify-content: space-between;
  min-height: 190px;
  padding: 34px 38px;
  overflow: hidden;
  color: #fff;
  background-color: var(--home-ink);
  background-image:
    linear-gradient(rgb(255 255 255 / 4.5%) 1px, transparent 1px),
    linear-gradient(90deg, rgb(255 255 255 / 4.5%) 1px, transparent 1px);
  background-size: 34px 34px;
  border-left: 5px solid #4f7cf0;
  border-radius: 10px;
}

.welcome-panel::after {
  position: absolute;
  top: -76px;
  right: 11%;
  width: 220px;
  height: 220px;
  border: 1px solid rgb(255 255 255 / 10%);
  border-radius: 50%;
  content: '';
  box-shadow:
    0 0 0 34px rgb(255 255 255 / 2.5%),
    0 0 0 68px rgb(255 255 255 / 1.8%);
}

.welcome-panel__copy {
  position: relative;
  z-index: 1;

  h1 {
    margin: 16px 0 10px;
    font-size: clamp(26px, 3vw, 38px);
    font-weight: 650;
    line-height: 1.2;
    letter-spacing: -0.5px;
  }

  p {
    margin: 0;
    font-size: 15px;
    line-height: 1.8;
    color: rgb(255 255 255 / 66%);
  }
}

.welcome-panel__eyebrow {
  display: flex;
  font-size: 13px;
  letter-spacing: 0.08em;
  color: rgb(255 255 255 / 72%);
  gap: 10px;
  align-items: center;
}

.welcome-panel__eyebrow-line {
  width: 28px;
  height: 2px;
  background: #5b86f5;
}

.system-status {
  position: relative;
  z-index: 1;
  display: flex;
  gap: 13px;
  align-items: center;
  min-width: 205px;
  padding: 14px 16px;
  background: rgb(255 255 255 / 8%);
  border: 1px solid rgb(255 255 255 / 12%);
  border-radius: 6px;
  backdrop-filter: blur(8px);

  strong,
  small {
    display: block;
  }

  strong {
    margin-bottom: 4px;
    font-size: 14px;
    font-weight: 600;
  }

  small {
    font-size: 12px;
    color: rgb(255 255 255 / 56%);
  }
}

.system-status__signal {
  width: 10px;
  height: 10px;
  background: #48cfa2;
  border-radius: 50%;
  box-shadow: 0 0 0 5px rgb(72 207 162 / 13%);
}

.content-panel {
  background: var(--home-paper);
  border: 1px solid var(--home-rule);
  border-radius: 10px;
}

.flow-panel {
  padding: 24px 28px 28px;
  margin-top: 16px;
}

.section-heading {
  display: flex;
  align-items: center;
  justify-content: space-between;
  margin-bottom: 24px;

  > div {
    display: flex;
    gap: 11px;
    align-items: center;
  }

  h2 {
    margin: 0;
    font-size: 18px;
    font-weight: 650;
    color: var(--el-text-color-primary);
  }

  p {
    margin: 0;
    font-size: 13px;
    color: var(--home-muted);
  }
}

.section-heading--compact {
  padding: 23px 24px 20px;
  margin: 0;
  border-bottom: 1px solid var(--home-rule);
}

.section-heading__index {
  display: inline-flex;
  width: 29px;
  height: 22px;
  font-family: 'Arial Narrow', Arial, sans-serif;
  font-size: 11px;
  font-weight: 700;
  letter-spacing: 0.06em;
  color: #fff;
  background: var(--home-blue);
  border-radius: 3px;
  align-items: center;
  justify-content: center;
}

.business-flow {
  display: grid;
  grid-template-columns: repeat(4, minmax(0, 1fr));
}

.flow-stage {
  position: relative;
  display: flex;
  gap: 12px;
  align-items: center;
  min-width: 0;
  padding: 14px 22px 14px 6px;
  color: inherit;
  text-align: left;
  cursor: pointer;
  background: transparent;
  border: 0;
  outline: 0;

  &:hover .flow-stage__icon {
    color: #fff;
    background: var(--home-blue);
    transform: translateY(-2px);
  }

  &:focus-visible {
    border-radius: 6px;
    box-shadow: 0 0 0 3px rgb(47 91 206 / 24%);
  }
}

.flow-stage__number {
  position: absolute;
  top: -7px;
  left: 4px;
  font-family: 'Arial Narrow', Arial, sans-serif;
  font-size: 10px;
  font-weight: 700;
  letter-spacing: 0.08em;
  color: var(--el-text-color-placeholder);
}

.flow-stage__icon,
.module-row__icon {
  display: inline-flex;
  flex: none;
  align-items: center;
  justify-content: center;
  transition:
    color 180ms ease,
    background-color 180ms ease,
    transform 180ms ease;
}

.flow-stage__icon {
  width: 44px;
  height: 44px;
  border-radius: 50%;
}

.flow-stage__icon--blue,
.module-row__icon--blue {
  color: #2f5bce;
  background: #edf2ff;
}

.flow-stage__icon--green,
.module-row__icon--green {
  color: #208464;
  background: #eaf7f2;
}

.flow-stage__icon--orange,
.module-row__icon--orange {
  color: #b86021;
  background: #fff2e8;
}

.flow-stage__icon--violet,
.module-row__icon--violet {
  color: #7152b3;
  background: #f2edff;
}

.flow-stage__icon--slate,
.module-row__icon--slate {
  color: #456079;
  background: #edf3f7;
}

.flow-stage__copy {
  min-width: 0;

  strong,
  small {
    display: block;
  }

  strong {
    margin-bottom: 5px;
    overflow: hidden;
    font-size: 14px;
    font-weight: 650;
    text-overflow: ellipsis;
    white-space: nowrap;
  }

  small {
    font-size: 12px;
    color: var(--home-muted);
  }
}

.flow-stage__connector {
  position: absolute;
  top: 50%;
  right: 6px;
  width: 20px;
  height: 1px;
  background: var(--el-border-color);

  &::after {
    position: absolute;
    top: -3px;
    right: 0;
    width: 6px;
    height: 6px;
    border-top: 1px solid var(--el-border-color);
    border-right: 1px solid var(--el-border-color);
    content: '';
    transform: rotate(45deg);
  }
}

.workspace-grid {
  display: grid;
  grid-template-columns: minmax(0, 1.65fr) minmax(300px, 0.75fr);
  gap: 16px;
  margin-top: 16px;
}

.module-list {
  padding: 0 24px;
}

.module-row {
  display: grid;
  grid-template-columns: 42px minmax(0, 1fr) auto;
  gap: 15px;
  align-items: center;
  width: 100%;
  padding: 17px 0;
  color: inherit;
  text-align: left;
  cursor: pointer;
  background: transparent;
  border: 0;
  border-bottom: 1px solid var(--home-rule);

  &:last-child {
    border-bottom: 0;
  }

  &:hover {
    .module-row__copy strong,
    .module-row__action {
      color: var(--home-blue);
    }

    .module-row__icon {
      transform: translateX(3px);
    }
  }

  &:focus-visible {
    outline: 2px solid rgb(47 91 206 / 40%);
    outline-offset: -2px;
  }
}

.module-row__icon {
  width: 42px;
  height: 42px;
  border-radius: 7px;
}

.module-row__copy {
  min-width: 0;

  strong,
  small {
    display: block;
  }

  strong {
    margin-bottom: 5px;
    font-size: 15px;
    font-weight: 650;
    transition: color 180ms ease;
  }

  small {
    overflow: hidden;
    font-size: 12px;
    color: var(--home-muted);
    text-overflow: ellipsis;
    white-space: nowrap;
  }
}

.module-row__action {
  font-size: 12px;
  color: var(--home-muted);
  transition: color 180ms ease;
}

.start-actions {
  padding: 18px 24px 6px;
}

.start-action {
  display: grid;
  grid-template-columns: minmax(0, 1fr) auto;
  gap: 7px 12px;
  align-items: center;
  width: 100%;
  padding: 17px 18px;
  margin-bottom: 12px;
  color: #fff;
  text-align: left;
  cursor: pointer;
  background: var(--home-ink);
  border: 0;
  border-radius: 7px;
  transition: transform 180ms ease;

  &:nth-child(2) {
    color: var(--el-text-color-primary);
    background: var(--el-fill-color-light);
    border: 1px solid var(--home-rule);

    .start-action__label {
      color: var(--home-blue);
    }
  }

  &:hover {
    transform: translateY(-2px);
  }

  &:focus-visible {
    outline: 3px solid rgb(47 91 206 / 28%);
    outline-offset: 2px;
  }

  strong {
    font-size: 15px;
    font-weight: 650;
  }
}

.start-action__label {
  font-size: 11px;
  letter-spacing: 0.1em;
  color: #8fafff;
  grid-column: 1 / -1;
}

.permission-note {
  display: flex;
  gap: 11px;
  align-items: flex-start;
  padding: 17px 24px 22px;
  color: var(--home-muted);

  > :first-child {
    flex: none;
    margin-top: 2px;
    color: var(--home-blue);
  }

  p {
    margin: 0;
  }

  strong,
  span {
    display: block;
  }

  strong {
    margin-bottom: 5px;
    font-size: 13px;
    font-weight: 650;
    color: var(--el-text-color-regular);
  }

  span {
    font-size: 12px;
    line-height: 1.7;
  }
}

@media (width <= 1050px) {
  .business-flow {
    grid-template-columns: repeat(3, minmax(0, 1fr));
    row-gap: 18px;
  }

  .flow-stage:nth-child(3) .flow-stage__connector {
    display: none;
  }
}

@media (width <= 1180px) {
  .home-workspace {
    padding: 14px;
  }

  .workspace-grid {
    grid-template-columns: 1fr;
  }
}

@media (width <= 620px) {
  .welcome-panel {
    display: block;
    min-height: auto;
    padding: 27px 24px;
  }

  .system-status {
    width: fit-content;
    margin-top: 24px;
  }

  .flow-panel {
    padding: 22px 20px;
  }

  .section-heading {
    display: block;

    p {
      margin-top: 9px;
      line-height: 1.6;
    }
  }

  .section-heading--compact {
    padding: 20px;
  }

  .business-flow {
    display: block;
  }

  .flow-stage {
    width: 100%;
    padding: 15px 6px 15px 14px;
  }

  .flow-stage__number {
    top: 5px;
    left: 0;
  }

  .flow-stage__connector {
    inset: auto auto -7px 35px;
    width: 1px;
    height: 18px;

    &::after {
      display: none;
    }
  }

  .flow-stage:nth-child(3) .flow-stage__connector {
    display: block;
  }

  .module-list,
  .start-actions {
    padding-right: 20px;
    padding-left: 20px;
  }

  .module-row {
    grid-template-columns: 42px minmax(0, 1fr);
  }

  .module-row__copy small {
    overflow: visible;
    line-height: 1.6;
    white-space: normal;
  }

  .module-row__action {
    display: none;
  }
}

@media (prefers-reduced-motion: reduce) {
  .flow-stage__icon,
  .module-row__icon,
  .start-action {
    transition: none;
  }
}
</style>
