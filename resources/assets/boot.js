import dayjs from 'dayjs'
import relativeTime from 'dayjs/plugin/relativeTime.js'
import timezone from 'dayjs/plugin/timezone.js'
import utc from 'dayjs/plugin/utc.js'
dayjs.extend(relativeTime)
dayjs.extend(utc)
dayjs.extend(timezone)

import Login from './pages/auth/Login.vue'
import Register from './pages/auth/Register.vue'
import Navbar from './components/Layout/Navbar.vue'

export const registerComponents = (app) => {
  app.component('Login', Login)
  app.component('Register', Register)
  app.component('Navbar', Navbar)
}

export const registerHelpers = (app) => {
  app.config.globalProperties.$filters = {
    formatDate(value) {
      return dayjs(value).fromNow()
    }
  }
}
