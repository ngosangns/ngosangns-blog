<script setup>
import { ref, onMounted } from 'vue'
import { useElementBounding, useWindowSize } from '@vueuse/core'

let isOpenCV = false

const logoDesc = ref()
const logoImg = ref()
const cvBg = ref()
const cv = ref()
let logoImgClone

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

onMounted(() => {
  // $('#export').off().on('click', exportPDF);
})
</script>
<template lang="pug">
#bg
  #info
    hr
    h1 ngosangns
    h2
      small Software Developer
    h3
      i.far.fa-envelope
      |&nbsp;ngosangns@gmail.com
    h3
      i.far.fa-compass
      |&nbsp;Ho Chi Minh City
    audio(controls)
      source(src="/konosekaide.mp3" type="audio/ogg")
  #logo
    span#logo-desc(ref="logoDesc")
      | Back to homepage &nbsp;
      i.fas.fa-hand-point-right
    #logo-img(ref="logoImg")
      a(href="/")
        img(src="/images/ngosangns.png")
      //- img(src="/images/ngosangns.png" @click="doShowCV")
#grid-wrapper
  .grid-1
    div
      h3
        i.far.fa-hand-peace
        |&nbsp;Tools
      li
        div KMA Tín chỉ
          .popup
            .wrapper
              a(href="https://tin-chi-ngosangns.web.app/" target="_blank")
                span Visit
                img(src="/images/kma-tinchi.png" alt="KMA Schedule")
      li
        div KMA Schedule
          .popup
            .wrapper
              a(href="https://kma-schedule-ngosangns.web.app/" target="_blank")
                span Visit
                img(src="/images/kma-schedule.png" alt="KMA Schedule")
      li
        div Bảng quản lí điểm
          .popup
            .wrapper
              a(href="https://docs.google.com/spreadsheets/d/1fu2yrF7OyUfNZC6qk1sZL8X8s6oxglaP/edit?usp=sharing&ouid=111945925521824045993&rtpof=true&sd=true" target="_blank")
                span Visit
                img(src="/images/bang-quan-ly-diem.png" alt="Bảng quản lí điểm")
    div
      h3
        i.far.fa-hand-lizard
        |&nbsp;Projects
      li
        div NS English
          .popup
            .wrapper
              a(href="https://english.ngosangns.me/" target="_blank")
                span Visit
                img(src="/images/ns-english.png" alt="NS English")
    .full
      h3
        i.far.fa-folder
        |&nbsp;Freelance projects
      .grid-2
        li
          div Future Wars
            .popup
              .wrapper
                a(href="https://ngosangns.github.io/futurewars.io/" target="_blank")
                  span Visit
                  img(src="/images/future-wars.jpg" alt="Future Wars")
        li
          div SinhLongDuong
            .popup
              .wrapper
                a(href="https://sinhlongduong.vn/" target="_blank")
                  span Visit
                  img(src="/images/sinhlongduong.jpg" alt="SinhLongDuong")
  .grid-1
    .full
      h3
        i.far.fa-star
        |&nbsp;Find me on
      .grid-2
        li
          a(href="https://www.facebook.com/ngosangns" target="_blank")
            | Facebook
        li
          a(href="https://www.linkedin.com/in/ngosangns" target="_blank")
            | LinkedIn
        li
          a(href="https://devchallenges.io/portfolio/ngosangns" target="_blank")
            | devChallenges
        li
          a(href="https://github.com/ngosangns" target="_blank")
            | Github
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
    .cv-heading
      .avatar
        img(src="/images/self-8.png" alt="Avatar")
      div
        h1 Ngô Quang Sang
        p
          strong VueJS & Laravel Developer
        table
          tr
            td 📎
            td
              a(href="https://ngosangns.me" target="_blank")
                | https://ngosangns.me
          tr
            td ✉️
            td ngosangns@gmail.com
          tr
            td 📞
            td
              a(href="tel:+84989096584")
                | +84989096584
          tr
            td 📍
            td Binh Chanh District, Ho Chi Minh City
    h2 🙍🏻‍♂️ Summary
    p
      .
        With 2 years of experience in web development, I have done many kinds of web projects and always
        want to try new challenges. I have a basic knowledge ofdeep learning and algorithms. Open-minded
        in learning and updating new knowledge.
    section
      h2 📕 Education
      div
        h3 🏫 Academy of Cryptography Techniques
        p 🎖️ Engineer's degree, Information Security
        p Activities and societies:
        .indented
          p Had joined the academy CTF contest, algorithm competition and science research.
            br
            | Mentor and member of KMA IT Club.
            br
            | Member of Communication Team of KMA Security Club.
            br
        p
    section
      h2 ✨ Skills
      p Language: JavaScript • TypeScript • Python • PHP.
        br
        | Framework: Vue.js • Laravel.
        br
        | Database: MySQL • Firebase.
        br
        | Others: OOP • HTML/CSS • Docker • Git.
        br
    section
      h2 🏢 Experience
      div
        h3 💼 VueJS & Laravel Developer
        p 🏢 Fois Việt Nam 🕓 Nov 2021 - Jan 2022
      div
        h3 💼 Full-stack Freelancer (part-time)
        p 🕓 June 2021 - Present
      div
        h3 💼 Back-end Developer (intern)
        p 🏢 Cerebro 🕓 Mar 2021 - Sep 2021
        p Built image processing system and analytic data system with Python (opencv, keras).
          br
        .indented
          p Template matching (OpenCV).
            br
            | Data categorization (Kmeans).
            br
        p
      div
        h3 💼 Front-end Web & Mobile Developer (part-time)
        p
          .
            🏢 Viethas Company
            🕓 Mar 2020 - Sep 2020
        p Projects:
        .indented
          p Viethas Sale: ERP app for associated businesses.
            br
            | Team size: 7.
            br
            | Role: Front-end developer.
            br
          p Viethas Energy: IoT monitoring system for business.
            br
            | Team size: 3.
            br
            | Role: Core front-end developer.
            br
        p
        p Framework: Angular, IONIC.
          br
          | Language: Javascript, Typescript.
          br
          | Others: HTML/CSS.
          br
          | Database: Firebase.
          br
        p Applied skills: Routing, Hook, front-end development with.
          br
          .
            HTML/CSS/JS/TS, OOP, Observable, request, Memory Management, JavaScript
            reference,...
          br
    section
      h2 🚀 Pet projects
      div
        h3 🐶 NS English
        p 🕓 Jul 2021
        p Increase your English vocabulary skills through some simple tests.
          br
          | Personally add your vocabulary to learn or using our available vocabulary store.
          br
        p Front-end: VueJS (Charka UI, Vue Router).
          br
          | Back-end: Golang (Echo web framework).
          br
          | Database: MySQL.
          br
        p Deployed URL:
          a(href="https://english.ngosangns.me/" target="_blank")
            | https://english.ngosangns.me
      div
        h3 🐶 KMA Tín chỉ & KMA Schedule
        p 🕓 Oct 2019 - Jan 2021
        p Created readable schedule timetable for KMA's students.
          br
          .
            Supported KMA's students in preparing and creating timetables for the next
            semester.
          br
        p Front-end: VueJS, Bootstrap, JQuery.
          br
          | Using Cloudflare Worker proxy.
          br
        p Deployed URL:
        .indented
          p
            a(href="https://kma-schedule-ngosangns.web.app/" target="_blank")
              | https://kma-schedule-ngosangns.web.app
            br
            a(href="https://tin-chi-ngosangns.web.app/" target="_blank")
              | https://tin-chi-ngosangns.web.app
            br
        p
      div
        h3 🐶 Malware detection
        p 🕓 Oct 2018 - Dec 2019
        p Console program is supported in scanning malware in your PC using deep learning.
          br
        p Language: Python (Keras).
        p Github:
          a(href="https://github.com/ngosangns/malware_detection")
            | https://github.com/ngosangns/malware_detection
          | .
    section
      h2 💸 Freelance projects
      div
        h3 🐶 Future Wars
        p 🕓 Sep 2021 - Oct 2021
        p The landing page of introduction of new NFT game will release in Q2 2022.
          br
        p Library: Vue standalone.
          br
        p Deployed URL:
          a(href="https://ngosangns.github.io/futurewars.io/" target="_blank")
            | https://ngosangns.github.io/futurewars.io
      div
        h3 🐶 SinhLongDuong
        p 🕓 Oct 2021 - Dec 2021
        p
          .
            Marketing channel of Sinh Long Duong pharmacy store. Including blog (categories, comments), videos,
            booking forms, admin dashboard (admin users, content manager, settings, email alerts), etc.
          br
        p Front-end libraries: Datetime picker, Glide (carousel), JQuery, Lightbox, Bootstrap.
          br
          | Back-end framework: Laravel.
          br
        p Deployed URL:
          a(href="https://sinhlongduong.vn/" target="_blank")
            | https://sinhlongduong.vn
</template>
