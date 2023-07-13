<template>
  <div
    class="flex w-full h-14 px-4 justify-between sticky top-0 bg-white border-b items-center"
  >
    <div class="text-2xl font-bold">ToDo</div>

    <div class="dropdown bg-transparent dropdown-bottom dropdown-end">
      <label tabindex="0" class="btn bg-transparent">
        <svg
          xmlns="http://www.w3.org/2000/svg"
          fill="none"
          viewBox="0 0 24 24"
          stroke-width="1.5"
          stroke="currentColor"
          class="w-6 h-6"
        >
          <path
            stroke-linecap="round"
            stroke-linejoin="round"
            d="M15.75 6a3.75 3.75 0 11-7.5 0 3.75 3.75 0 017.5 0zM4.501 20.118a7.5 7.5 0 0114.998 0A17.933 17.933 0 0112 21.75c-2.676 0-5.216-.584-7.499-1.632z"
          />
        </svg>
      </label>
      <ul
        tabindex="0"
        class="dropdown-content menu p-2 shadow bg-base-100 rounded-box w-52 z-50"
      >
        <li><a href="/profile">Profile</a></li>
        <li>
          <form method="post" action="/logout">
            <button class="w-full" type="submit">Logout</button>
          </form>
        </li>
      </ul>
    </div>
  </div>
</template>
<script>
import { defineComponent } from 'vue'

export default defineComponent({
  name: 'Navbar',
})
</script>