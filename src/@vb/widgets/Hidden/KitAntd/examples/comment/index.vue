<template>
  <div>
    <h5 class="mb-3">
      <strong>Basic</strong>
    </h5>
    <div class="mb-5">
      <a-comment>
        <template #actions>
          <span>
            <a-tooltip title="Like">
              <a-icon
                type="like"
                :theme="action === 'liked' ? 'filled' : 'outlined'"
                @click="like"
              />
            </a-tooltip>
            <span style="padding-left: '8px'; cursor: 'auto'">{{ likes }}</span>
          </span>
          <span>
            <a-tooltip title="Dislike">
              <a-icon
                type="dislike"
                :theme="action === 'disliked' ? 'filled' : 'outlined'"
                @click="dislike"
              />
            </a-tooltip>
            <span style="padding-left: '8px'; cursor: 'auto'">{{ dislikes }}</span>
          </span>
          <span>Reply to</span>
        </template>
        <template #author>
          <a>Han Solo</a>
        </template>
        <template #avatar>
          <a-avatar
            src="https://zos.alipayobjects.com/rmsportal/ODTLcjxAfvqbxHnVXCYX.png"
            alt="Han Solo"
          />
        </template>
        <template #content>
          <p>
            We supply a series of design principles, practical patterns and high quality design
            resources (Sketch and Axure), to help people create their product prototypes beautifully
            and efficiently.
          </p>
        </template>
        <template #autdatetimehor>
          <a-tooltip :title="moment().format('YYYY-MM-DD HH:mm:ss')">
            <span>{{ moment().fromNow() }}</span>
          </a-tooltip>
        </template>
      </a-comment>
    </div>
    <h5 class="mb-3">
      <strong>Nested</strong>
    </h5>
    <div class="mb-5">
      <a-comment>
        <template #actions>
          <span>Reply to</span>
        </template>
        <template #author>
          <a>Han Solo</a>
        </template>
        <template #avatar>
          <a-avatar
            src="https://zos.alipayobjects.com/rmsportal/ODTLcjxAfvqbxHnVXCYX.png"
            alt="Han Solo"
          />
        </template>
        <template #content>
          <p>
            We supply a series of design principles, practical patterns and high quality design
            resources (Sketch and Axure).
          </p>
        </template>
        <a-comment>
          <template #actions>
            <span>Reply to</span>
          </template>
          <template #author>
            <a>Han Solo</a>
          </template>
          <template #avatar>
            <a-avatar
              src="https://zos.alipayobjects.com/rmsportal/ODTLcjxAfvqbxHnVXCYX.png"
              alt="Han Solo"
            />
          </template>
          <template #content>
            <p>
              We supply a series of design principles, practical patterns and high quality design
              resources (Sketch and Axure).
            </p>
          </template>
        </a-comment>
      </a-comment>
    </div>
  </div>
</template>
<script>
import moment from 'moment'
export default {
  name: 'KitAntdCommentExample',
  data() {
    return {
      likes: 0,
      dislikes: 0,
      action: null,
      moment,
    }
  },
  methods: {
    like() {
      this.likes = 1
      this.dislikes = 0
      this.action = 'liked'
    },
    dislike() {
      this.likes = 0
      this.dislikes = 1
      this.action = 'disliked'
    },
  },
}
</script>
