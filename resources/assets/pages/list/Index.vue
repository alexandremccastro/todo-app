<template>
  <div class="flex w-full items-center justify-center">
    <button
      @click="showListModal"
      class="btn btn-success rounded-full btn-circle absolute bottom-10 right-10 z-50"
    >
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
          d="M12 4.5v15m7.5-7.5h-15"
        />
      </svg>
    </button>

    <dialog id="createListModal" className="modal">
      <div className="modal-box">
        <form method="post" action="/lists" @submit="attemptSave">
          <div class="flex items-center mb-5">
            <h3 className="font-bold text-xl">New List</h3>
            <button
              type="button"
              className="btn btn-xs btn-circle btn-ghost absolute right-2 top-2"
              @click="closeListModal"
            >
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
                  d="M6 18L18 6M6 6l12 12"
                />
              </svg>
            </button>
          </div>

          <div>
            <TextField
              label="Name"
              name="name"
              v-model="v$.list.name.$model"
              :errors="v$.list.name.$errors"
            />
          </div>

          <div class="flex justify-end">
            <button class="btn mr-4" type="button" @click="closeListModal">
              Close
            </button>
            <button class="btn btn-success">Submit</button>
          </div>
        </form>
      </div>
    </dialog>
  </div>
</template>
<script>
import { defineComponent } from 'vue'
import TextField from '@/components/Form/TextField.vue'
import { useVuelidate } from '@vuelidate/core'
import { validations as mockedValidations } from '@/core/validations/mock'
import { maxLength } from '@vuelidate/validators'

export default defineComponent({
  name: 'ListIndex',
  components: { TextField },
  setup() {
    return { v$: useVuelidate() }
  },

  data() {
    return {
      list: {
        name: '',
      },
    }
  },

  validations() {
    const { required } = mockedValidations
    return {
      list: {
        name: { required, maxLength: maxLength(100) },
      },
    }
  },

  methods: {
    showListModal() {
      createListModal.show()
    },
    closeListModal() {
      createListModal.close()
    },
    async attemptSave(e) {
      const isValidated = await this.v$.$validate()

      if (!isValidated) e.preventDefault()
    },
  },
})
</script>
