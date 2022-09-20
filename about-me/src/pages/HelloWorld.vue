<script setup>
import { ref, onMounted, computed } from 'vue'

// let isOpenCV = false

// const logoDesc = ref()
// const logoImg = ref()
// const cvBg = ref()
// const cv = ref()
// let logoImgClone

// function exportPDF() {
//   var WinPrint = window.open('', '', 'left=0,top=0,width=2000,height=2000,toolbar=0,scrollbars=0,status=0');
//   WinPrint.document.write("<html>");
//   WinPrint.document.write(document.getElementsByTagName('head')[0].outerHTML);
//   WinPrint.document.write("<body>");
//   WinPrint.document.write(document.getElementById("cv").outerHTML);
//   WinPrint.document.write("</body>");
//   WinPrint.document.write("</html>");
//   WinPrint.onload = function () {
//     WinPrint.document.getElementsByTagName('body')[0].classList.add("body-print");
//     WinPrint.document.getElementById('close').remove();
//     WinPrint.document.getElementById('export').remove();
//     WinPrint.document.getElementById('download').remove();
//     WinPrint.print();
//     WinPrint.close();
//   }
//   WinPrint.document.close();
//   WinPrint.focus();
// }

// function doShowCV() {
//   // Logo image
//   logoDesc.value.style.opacity = 0
//   logoDesc.value.style.transition = 'none'
//   logoImg.value.style.opacity = 0
//   const logoImgBounding = useElementBounding(logoImg)
//   logoImgClone = ref(logoImg.value.cloneNode(true))
//   logoImgClone.value.style.left = logoImgBounding.x.value + "px"
//   logoImgClone.value.style.top = logoImgBounding.y.value + "px"
//   logoImgClone.value.style.margin = "0"
//   logoImgClone.value.style.opacity = "1"
//   logoImgClone.value.style.position = "fixed"
//   logoImgClone.value.style["z-index"] = "1"
//   logoImgClone.value.style.transition = "all 900ms cubic-bezier(0.25, 0.1, 0.25, 1)"
//   logoImgClone.value.style.animation = "logo 900ms forwards"
//   logoImgClone.value.style["animation-timing-function"] = "cubic-bezier(0.25, 0.1, 0.25, 1)"
//   document.body.appendChild(logoImgClone.value)
//   // CV background
//   setTimeout(() => {
//     const windowSize = useWindowSize()
//     const maxScreenDimensionLength = Math.sqrt(Math.pow(windowSize.width.value, 2) + Math.pow(windowSize.height.value, 2))
//     const cvBgX = (windowSize.width.value - maxScreenDimensionLength) / 2
//     const cvBgY = (windowSize.height.value - maxScreenDimensionLength) / 2
//     cvBg.value.style.cssText = `top: ${cvBgY}px!important; left: ${cvBgX}px!important; width: ${maxScreenDimensionLength}px!important; height: ${maxScreenDimensionLength}px!important; transition: all 648ms cubic-bezier(0.25, 0.1, 0.25, 1);`
//     // CV
//     setTimeout(() => {
//       cv.value.classList.add("cv-enter-to")
//       cv.value.style.transition = "all 648ms cubic-bezier(0.25, 0.1, 0.25, 1)"
//       document.body.classList.add("max-screen-height")
//       isOpenCV = true
//     }, 500)
//   }, 900)
// }

// function doHideCV() {
//   // CV
//   cv.value.classList.remove("cv-enter-to")
//   cv.value.style.transition = "all 648ms cubic-bezier(0.25, 0.1, 0.25, 1)"
//   cv.value.style["transition-delay"] = "0s"
//   // Setup logo
//   const windowSize = useWindowSize()
//   const logoImgCloneBounding = useElementBounding(logoImgClone)
//   logoImgClone.value.style.left = (windowSize.width.value / 2 - logoImgCloneBounding.width.value / 2) + "px"
//   logoImgClone.value.style.top = (windowSize.height.value / 2 - logoImgCloneBounding.height.value / 2) + "px"
//   logoImgClone.value.style.animation = "none"
//   logoImgClone.value.style.transition = "all 650ms cubic-bezier(0.25, 0.1, 0.25, 1)"
//   setTimeout(() => {
//     // CV background
//     cvBg.value.style.cssText = `top: 50vh!important; 
//       left: 50vw!important; 
//       width: 0!important; 
//       height: 0!important; 
//       transition: all 650ms cubic-bezier(0.25, 0.1, 0.25, 1);`
//     document.body.classList.remove("max-screen-height")
//     // Logo
//     setTimeout(() => {
//       const logoImgBounding = useElementBounding(logoImg)
//       logoImgClone.value.style.left = logoImgBounding.x.value + "px"
//       logoImgClone.value.style.top = logoImgBounding.y.value + "px"
//       logoImgClone.value.style.transform = "rotate(360deg)"
//       setTimeout(() => {
//         logoDesc.value.style.opacity = 1
//         logoDesc.value.style.transition = "all 100ms linear"
//         logoImg.value.style.opacity = 1
//         logoImg.value.style.transition = "all 100ms linear"
//         setTimeout(() => {
//           logoImgClone.value.remove()
//           isOpenCV = false
//         }, 100)
//       }, 650)
//     }, 648)
//   }, 300)
// }

const triggerWhenWindowResize = ref(true)
const imageSizePath = computed(() => {
  triggerWhenWindowResize.value
  if (window.innerWidth < 620) return 'sm'
  return 'md'
})

// lazy load background
// const img = new Image()
// img.onload = () => {
//   bg.value.classList.remove('bg-preload')
// }
// img.src = `./images/${imageSizePath.value}/bg.webp`

window.addEventListener('resize', () => {
  triggerWhenWindowResize.value = !triggerWhenWindowResize.value
})

// Projects
const projects = [
  {
    name: 'Tools',
    icon: './svg/tool.svg',
    items: [
      {
        name: 'KMA Tín chỉ',
        desc: 'Trang web hỗ trợ xếp lịch cho các tín chỉ dự định đăng ký trong kì học tới.',
        image: `./images/${imageSizePath.value}/kma-tinchi.webp`,
        link: 'https://tin-chi-ngosangns.web.app/',
      },
      {
        name: 'KMA Schedule',
        desc: 'Xem lịch học cá nhân tại trường Học viện Kỹ thuật Mật Mã một cách dễ dàng hơn.',
        image: `./images/${imageSizePath.value}/kma-schedule.webp`,
        link: 'https://kma-schedule-ngosangns.web.app/',
      },
      {
        name: 'Bảng quản lí điểm',
        desc: 'File Excel quản lý điểm theo tín chỉ hỗ trợ sắp xếp, tính GPA tuỳ chọn và quản lý các môn học.',
        image: `./images/${imageSizePath.value}/bang-quan-ly-diem.webp`,
        link: 'https://docs.google.com/spreadsheets/d/1fu2yrF7OyUfNZC6qk1sZL8X8s6oxglaP/edit?usp=sharing&ouid=111945925521824045993&rtpof=true&sd=true',
      },
    ],
  },
  {
    name: 'Personal projects',
    icon: './svg/pool.svg',
    items: [
      {
        name: 'NS English',
        desc: 'Trang web giúp bạn học từ vựng tiếng Anh và hỗ trợ các bài tập rèn luyện.',
        image: `./images/${imageSizePath.value}/ns-english.webp`,
        link: 'https://english.ngosangns.me/',
      },
    ],
  },
  {
    name: 'Freelance projects',
    icon: './svg/work.svg',
    items: [
      {
        name: 'Future Wars',
        desc: 'Landing-page của một game NFT.',
        image: `./images/${imageSizePath.value}/future-wars.webp`,
        link: 'https://ngosangns.github.io/futurewars.io/',
      },
      {
        name: 'SinhLongDuong',
        desc: 'Trang web đặt lịch khám online cho nhà thuốc kết hợp chia sẻ các bài viết về sức khoẻ.',
        image: `./images/${imageSizePath.value}/sinhlongduong.webp`,
        link: 'https://sinhlongduong.vn/',
      },
    ],
  },
]
</script>
<template lang="pug">
header#header
  .bg.bg-preload(ref="bg")
  #info
    h1 ngosangns
    h2
      small Software Developer
    h3
      img(src="/svg/mail.svg" class="svg")
      | &nbsp;ngosangns@gmail.com
    h3
      img(src="/svg/location.svg" class="svg")
      | &nbsp;Ho Chi Minh City
    audio(controls)
      source(src="/konosekaide.mp3" type="audio/ogg")
  #logo
    span#logo-desc(ref="logoDesc")
      | Back to homepage &nbsp;
      img(src="/svg/right.svg" class="svg")
    #logo-img(ref="logoImg")
      a(href="/")
        img(:src="`./images/${imageSizePath}/ngosangns.webp`")
#grid-wrapper
  .grid-1
    .full(v-for="group of projects")
      h3
        img(:src="group.icon" class="svg")
        | &nbsp;{{group.name}}
      .grid-2
        li(v-for="item of group.items")
          a(:href="item.link" target="_blank")
            img(:src="item.image" :alt="item.name")
            span {{item.name}}
            small {{item.desc}}
  .grid-1
    .full
      h3
        img(src="/svg/star.svg" class="svg")
        |&nbsp;Find me on
      .grid-2
        li
          a(href="https://www.facebook.com/ngosangns" target="_blank")
            span Facebook
        li
          a(href="https://www.linkedin.com/in/ngosangns" target="_blank")
            span LinkedIn
        li
          a(href="https://devchallenges.io/portfolio/ngosangns" target="_blank")
            span devChallenges
        li
          a(href="https://github.com/ngosangns" target="_blank")
            span Github
//- #cv-bg(ref="cvBg")
//- article#cv.page.sans(ref="cv")
  #toolbar
    #download
      a(href="https://drive.google.com/file/d/1uFmBmYQHhxP0aLqUNheaTIVpnAdl0wGP/view?usp=sharing" target="_blank")
        i.fa.fa-cloud-download-alt
    #export(@click="exportPDF")
      i.fa.fa-print
    #close(@click="doHideCV")
      i.fa.fa-close
  .page-body
</template>
