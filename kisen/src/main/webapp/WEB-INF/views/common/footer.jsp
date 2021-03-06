<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
</section>


<hr>
<footer class="d-none d-lg-block ">
    <div class="footer-div d-flex justify-content-center">
        
        <ul class="footer-ul">
            <li> <h6> <span class="span-color-h">CS CENTER</span></h6></li>
            <li>전화번호</li>
            <li><span class="span-color rounded">상담시간</span> AM 10:00 ~ PM 17:00</li>
            <li><span class="span-color rounded">점심시간</span> PM 12:00 ~ PM 14:00</li>
            <li>토요일 일요일 공휴일 휴무</li>
            <li> E-mail : kisen@google.com</li>
        </ul>
    
    
        <ul class="footer-ul">
            <li><h6> <span class="span-color-h">회사소개</span></h6></li>
            <li> <a href="${pageContext.request.contextPath}/about/aboutus.do"> 회사소개</a></li>
            <li> <a href="${pageContext.request.contextPath}/about/location.do"> 오시는길</a></li>
            <li> <a href="${pageContext.request.contextPath}/notice"> 공지사항</a></li>
         <li>
            <div class="kakao">
                 <div id="kakao-talk-channel-chat-button" data-channel-public-id="_ixagws" data-title="consult" data-size="small"
                      data-color="mono" data-shape="pc" data-support-multiple-densities="true"></div>
               </div>
            </li>
        </ul>
        
        <ul class="footer-ul">
            <li><h6> <span class="span-color-h">반품주소</span></h6></li>
            <li>  서울특별시 강남구 테헤란로10길 9 그랑프리 빌딩</li>
            <li> 반드시 지정택배사를 이용해 주세요.</li>
            <li><span class="span-color rounded">지정택배사</span> CJ대한통운</li>
        </ul>
    </div>
    <hr>
    <div class="footer-div d-flex justify-content-center">
        <ul class="footer-introduce">
            <li> <span>회사명</span> KISEN  <span>대표전화</span> 0000-0000</li>
            <li> <span> 사업장주소</span> 서울특별시 강남구 테헤란로10길 9 그랑프리 빌딩</li>
            <li> <span>개인정보관리책임자</span>  KISEN(kisen@google.com)</li>
            <li> <span>쇼핑몰의 모든 제작물의 저작권은 </span> KISEN <span> 에 있으며, 무단복제나 도용은 저작권법(97조5항)에 의해 금지되어 있습니다.</span></li>
            <li>&lt;Copyright 2017. <strong>KI-SEN</strong>. All rights reserved.&gt; hosting by AWS</li>

        </ul>
    </div>

</footer>
     <script>
        // 카카오톡 톡상담
        window.kakaoAsyncInit = function () {
          Kakao.Channel.createChatButton({
            container: '#kakao-talk-channel-chat-button',
          });
        };

        (function (d, s, id) {
          var js, fjs = d.getElementsByTagName(s)[0];
          if (d.getElementById(id)) return;
          js = d.createElement(s); js.id = id;
          js.src = 'https://developers.kakao.com/sdk/js/kakao.channel.min.js';
          fjs.parentNode.insertBefore(js, fjs);
        })(document, 'script', 'kakao-js-sdk');
      </script>
<script src="${pageContext.request.contextPath}/resources/js/sideBanner.js"></script>
</body>
</html>