<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>home</title>
<link rel="apple-touch-icon" type="image/png" href="https://cpwebassets.codepen.io/assets/favicon/apple-touch-icon-5ae1a0698dcc2402e9712f7d01ed509a57814f994c660df9f7a952f3060705ee.png" />

    <meta name="apple-mobile-web-app-title" content="CodePen">

    <link rel="shortcut icon" type="image/x-icon" href="https://cpwebassets.codepen.io/assets/favicon/favicon-aec34940fbc1a6e787974dcd360f2c6b63348d4b1f4e06c77743096d55480f33.ico" />

    <link rel="mask-icon" type="image/x-icon" href="https://cpwebassets.codepen.io/assets/favicon/logo-pin-b4b4269c16397ad2f0f7a01bcdf513a1994f4c94b8af2f191c09eb0d601762b1.svg" color="#111" />



  
    <script src="https://cpwebassets.codepen.io/assets/common/stopExecutionOnTimeout-2c7831bb44f98c1391d6a4ffda0e1fd302503391ca806e7fcc7b9b87197aec26.js"></script>
<link rel="canonical" href="https://codepen.io/yujin-lee-the-sans/pen/gOZXQja">
  <link href="https://fonts.googleapis.com/css2?family=Luckiest+Guy&display=swap" rel="stylesheet">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">

  
  
<style>
* {
  box-sizing: border-box;
}

html {
  font-size: 62.5%;
}

body {
  font-size: 1.6rem;
  background: #fffffe;
  font-family: "Luckiest Guy", cursive;
}

img {
  width: 100%;
}

header {
  position: fixed;
  left: 0;
  top: 0;
  width: 100%;
  padding: 2.3rem 0 0.5rem;
  background: #fffffe;
  z-index: 1;
}

.logo {
  text-align: center;
  font-size: 6vw;
  text-transform: uppercase;
  opacity: 0;
  position: relative;
  left: 0;
  top: 0;
  width: 100%;
  color: #ffbf77;
  text-shadow: 0 0 2px rgba(0, 0, 0, 0.3);
}

.menu {
  position: absolute;
  top: 50%;
  transform: translateY(-50%);
  right: 2rem;
  background: none;
  width: 3rem;
  height: 2rem;
  cursor: pointer;
  border: none;
  padding: 0;
  opacity: 0;
}
@media (min-width: 730px) {
  .menu {
    right: 10%;
  }
}
.menu span {
  display: block;
  width: 100%;
  height: 2px;
  background: black;
}
.menu span:after, .menu span:before {
  content: "";
  position: absolute;
  width: 100%;
  height: 2px;
  left: 0;
  background: inherit;
}
.menu span:before {
  top: 0;
}
.menu span:after {
  bottom: 0;
}

.o-wrapper {
  padding: 0 2rem;
}
@media (min-width: 730px) {
  .o-wrapper {
    padding: 0 10%;
  }
}

.gallery {
  padding-top: 150vh;
  display: grid;
  list-style-type: none;
  grid-template-columns: repeat(2, minmax(0, 1fr));
  gap: 2rem;
}
@media (min-width: 730px) {
  .gallery {
    grid-template-columns: repeat(3, minmax(0, 1fr));
  }
}

.image {
  aspect-ratio: 2/3;
}
.image img {
  height: 100%;
  object-fit: cover;
}

footer {
  margin-top: 10rem;
  text-align: center;
  font-size: 6vw;
  letter-spacing: 0.1em;
  padding-bottom: 20rem;
}
@media (min-width: 730px) {
  footer {
    margin-top: 20rem;
    padding-bottom: 20rem;
  }
}
</style>
</head>
<body translate="no">
  <header>
  <h1 class="logo">BOBIT</h1>
  <button class="menu">
    <span></span>
  </button>
</header>
<main id="wrapper">
  <div id="content" class="o-wrapper">
    <ul class="gallery">
        <li class="gal_img">
            <img src="" alt="">
        </li>
        <li class="gal_img">
            <img src="" alt="">
        </li>
        <li class="gal_img">
            <img src="" alt="">
        </li>
        <li class="gal_img">
            <img src="" alt="">
        </li>
        <li class="gal_img">
            <img src="" alt="">
        </li>
        <li class="gal_img">
            <img src="" alt="">
        </li>
        <li class="gal_img">
            <img src="" alt="">
        </li>
        <li class="gal_img">
            <img src="" alt="">
        </li>
        <li class="gal_img">
            <img src="" alt="">
        </li>
        <li class="gal_img">
            <img src="" alt="">
        </li>
    </ul>
    <footer>
      <h2 class="end">
        Let’s eat delicious food together</h2>
    </footer>
  </div>
</main>
  <script src='https://assets.codepen.io/16327/gsap-latest-beta.min.js?v=cachebust'></script>
<script src='https://assets.codepen.io/16327/ScrollTrigger.min.js?v=cachebust'></script>
<script src='https://assets.codepen.io/16327/ScrollSmoother.min.js?v=cachebust'></script>
<script src='https://assets.codepen.io/16327/SplitText3.min.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/chroma-js/2.4.2/chroma.min.js'></script>
      <script id="rendered-js" >
gsap.registerPlugin(ScrollTrigger, ScrollSmoother, SplitText);

/* Fade in the logo */
gsap.fromTo('.logo', {
  opacity: 0,
  yPercent: 50 },
{
  yPercent: -50,
  opacity: 1,
  duration: 1,
  ease: 'power3.out' });


/* Smooth content */
let smoother = ScrollSmoother.create({
  wrapper: "#wrapper",
  content: "#content",
  smooth: 1,
  effects: true });


smoother.effects(".image", {
  speed: i => {
    // Desktop three columns layout
    if (window.matchMedia('(min-width:730px)').matches) {
      // Center column is faster
      return i % 3 === 1 ? 1.15 : 1;
    } else {
      // Mobile, right column is fast
      return i % 2 === 0 ? 1 : 1.15;
    }
  } });



/* Logo to header animation */
let logoTl = gsap.timeline({
  scrollTrigger: {
    trigger: document.body,
    start: 0,
    end: () => window.innerHeight * 1.2,
    scrub: 0.6 } });


logoTl.fromTo('.logo', {
  top: '50vh',
  yPercent: -50,
  scale: 4,
  textShadow: '0 0 2px rgba(0,0,0,0.3)' },
{
  top: 0,
  yPercent: 0,
  scale: 1,
  textShadow: '0 0 2px rgba(0,0,0,0)',
  duration: 0.8 });

// Toggle the burger visibility
logoTl.fromTo('.menu', {
  opacity: 0 },
{
  opacity: 1,
  duration: 0.1 },
0.9);
// Toggle the header box-shadow
logoTl.fromTo('header', {
  boxShadow: '0px 0px 10px rgba(0,0,0,0)' },
{
  boxShadow: '0px 0px 10px rgba(0,0,0,.15)',
  duration: 0.2 },
0.8);


/* That's all Folks animation */
let endTl = gsap.timeline({
  repeat: -1,
  delay: 0.5,
  scrollTrigger: {
    trigger: '.end',
    start: 'bottom 100%-=50px' } });


gsap.set('.end', {
  opacity: 0 });

gsap.to('.end', {
  opacity: 1,
  duration: 1,
  ease: 'power2.out',
  scrollTrigger: {
    trigger: '.end',
    start: 'bottom 100%-=50px',
    once: true } });


let mySplitText = new SplitText(".end", { type: "words,chars" });
let chars = mySplitText.chars;
let endGradient = chroma.scale(['#F9D371', '#F47340', '#EF2F88', '#8843F2']);
endTl.to(chars, {
  duration: 0.5,
  scaleY: 0.6,
  ease: "power3.out",
  stagger: 0.04,
  transformOrigin: 'center bottom' });

endTl.to(chars, {
  yPercent: -20,
  ease: "elastic",
  stagger: 0.03,
  duration: 0.8 },
0.5);
endTl.to(chars, {
  scaleY: 1,
  ease: "elastic.out(2.5, 0.2)",
  stagger: 0.03,
  duration: 1.5 },
0.5);
endTl.to(chars, {
  color: (i, el, arr) => {
    return endGradient(i / arr.length).hex();
  },
  ease: "power2.out",
  stagger: 0.03,
  duration: 0.3 },
0.5);
endTl.to(chars, {
  yPercent: 0,
  ease: "back",
  stagger: 0.03,
  duration: 0.8 },
0.7);
endTl.to(chars, {
  color: 'hsl(0,0,0)',
  duration: 1.4,
  stagger: 0.05 });


let menu = document.querySelector('.menu');

menu.addEventListener('click', e => {
  ScrollTrigger.refresh();
});
//# sourceURL=pen.js
    </script>

  
  <script src="https://cpwebassets.codepen.io/assets/editor/iframe/iframeRefreshCSS-44fe83e49b63affec96918c9af88c0d80b209a862cf87ac46bc933074b8c557d.js"></script>
</body>
</html>