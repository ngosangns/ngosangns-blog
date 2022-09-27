<script setup>
import GridProjectList from "./../components/GridProjectList.vue";
import { ref, onMounted, computed } from "vue";

const triggerWhenWindowResize = ref(true);
const imageSizePath = computed(() => {
  triggerWhenWindowResize.value;
  if (window.innerWidth < 620) return "sm";
  return "md";
});

window.addEventListener("resize", () => {
  triggerWhenWindowResize.value = !triggerWhenWindowResize.value;
});

const personalProjects = {
  name: "Personal projects",
  icon: "./svg/pool.svg",
  type: "project",
  items: [
    {
      name: "KMA Schedule",
      desc: "Xem lịch học cá nhân tại trường Học viện Kỹ thuật Mật Mã một cách dễ dàng hơn.",
      image: `./images/${imageSizePath.value}/kma-schedule.webp`,
      link: "https://kma-schedule-ngosangns.web.app/",
    },
    {
      name: "KMA Tín chỉ",
      desc: "Trang web hỗ trợ xếp lịch cho các tín chỉ dự định đăng ký trong kì học tới.",
      image: `./images/${imageSizePath.value}/kma-tinchi.webp`,
      link: "https://tin-chi-ngosangns.web.app/",
    },
    {
      name: "Bảng quản lí điểm",
      desc: "File Excel quản lý điểm theo tín chỉ hỗ trợ sắp xếp, tính GPA tuỳ chọn và quản lý các môn học.",
      image: `./images/${imageSizePath.value}/bang-quan-ly-diem.webp`,
      link: "https://docs.google.com/spreadsheets/d/1fu2yrF7OyUfNZC6qk1sZL8X8s6oxglaP/edit?usp=sharing&ouid=111945925521824045993&rtpof=true&sd=true",
    },
    {
      name: "NS English",
      desc: "Trang web giúp bạn học từ vựng tiếng Anh và hỗ trợ các bài tập rèn luyện.",
      image: `./images/${imageSizePath.value}/ns-english.webp`,
      link: "https://english.ngosangns.me/",
    },
  ],
};

const freelanceProjects = {
  name: "Freelance projects",
  icon: "./svg/work.svg",
  type: "project",
  items: [
    {
      name: "Future Wars",
      desc: "Landing-page của một game NFT.",
      image: `./images/${imageSizePath.value}/future-wars.webp`,
      link: "https://ngosangns.github.io/futurewars.io/",
    },
    {
      name: "SinhLongDuong",
      desc: "Trang web đặt lịch khám online cho nhà thuốc kết hợp chia sẻ các bài viết về sức khoẻ.",
      image: `./images/${imageSizePath.value}/sinhlongduong.webp`,
      link: "https://sinhlongduong.vn/",
    },
  ],
};

const findMeOn = {
  name: "Find me on",
  icon: "./svg/star.svg",
  type: "social",
  items: [
    {
      name: "LinkedIn",
      icon: "./svg/linkedin.svg",
      link: "https://www.linkedin.com/in/ngosangns/",
    },
    {
      name: "Github",
      icon: "./svg/github.svg",
      link: "https://github.com/ngosangns/",
    },
    {
      name: "Facebook",
      icon: "./svg/facebook.svg",
      link: "https://www.facebook.com/ngosangns/",
    },
    // {
    //   name: "devChallenges",
    //   icon: ``,
    //   link: "https://devchallenges.io/portfolio/ngosangns/",
    // },
  ],
};

onMounted(() => {
  // Load SVGs
  for (const item of document.getElementsByTagName("img")) {
    if (!item.hasAttribute("data-src")) continue;

    // Set default width and height attributes
    if (item.classList.contains("svg")) {
      // 1 : 1 for SVGs
      item.setAttribute("width", "16");
      item.setAttribute("height", "16");
    } else if (item.classList.contains("logo-img-img")) {
      // 1 : 1 for avatar
      item.setAttribute("width", "80");
      item.setAttribute("height", "80");
    } else {
      // 16 : 9 for default image
      item.setAttribute("width", "250");
      item.setAttribute("height", "140");
    }

    const img = new Image();
    img.onload = function () {
      item.setAttribute("src", String(item.getAttribute("data-src")));
    };
    img.src = String(item.getAttribute("data-src"));
  }
});
</script>
<template lang="pug">
header#header
  .bg.bg-preload(ref="bg")
  #info
    h1 ngosangns
    h2
      small Software Developer
    .h3-wrapper
      h3
        img.svg(data-src="./svg/mail.svg")
        | &nbsp;ngosangns@gmail.com
      h3
        img.svg(data-src="./svg/location.svg")
        | &nbsp;Ho Chi Minh City
    .social-wrapper
      a(v-for="item of findMeOn.items", :href="item.link", target="_blank")
        img.svg(:data-src="item.icon")

    span.audio-name
      | Kono Sekai De - Leo Ieiri
    audio(controls)
      source(src="/konosekaide.mp3", type="audio/ogg")
  #logo
    span#logo-desc
      | Back to homepage &nbsp;
      img.svg(data-src="./svg/right.svg")
    #logo-img
      a(href="/")
        img.logo-img-img(
          :data-src="`./images/${imageSizePath}/ngosangns.webp`"
        )

.grid-wrapper
  GridProjectList(:group="personalProjects")
  GridProjectList(:group="freelanceProjects")
</template>
