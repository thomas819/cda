import 'package:cda/app/widgets/review_item.dart';
import 'package:cda/core/values/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:like_button/like_button.dart';

class ReviewPage extends StatelessWidget {
  final List<Map<String, dynamic>> reviews = [
    {
      'username': 'art_inuit',
      'profileImage': null,
      'artworkImage':
          'https://inblog.ai/_next/image?url=https%3A%2F%2Ffgobbnslcbjgothosvni.supabase.co%2Fstorage%2Fv1%2Fobject%2Fpublic%2Fimages%2Ffeatured_image%2F2023-12-14T08%3A49%3A30.551Z-ba89cf12-6223-45fa-8447-a7e9a897e59c&w=3840&q=75',
      'exhibitionTitle': '빛의 예술展',
      'exhibitionImage':
          'https://www.mmca.go.kr/upload/exhibition/2023/08/2023082505420682414560.jpg',
      'likes': 12,
      'comments': 8,
      'content':
          '이번 전시는 빛의 다양한 표현 방식을 탐구하는 작품들로 가득했습니다. 특히 조명과 공간의 조화를 통한 작품이 매우 인상 깊었습니다.',
    },
    {
      'username': 'modern_lover',
      'profileImage': null,
      'artworkImage':
          'https://inblog.ai/_next/image?url=https%3A%2F%2Fwww.notion.so%2Fimage%2Fhttps%253A%252F%252Fprod-files-secure.s3.us-west-2.amazonaws.com%252F15bbba9c-973b-463b-970d-5b1d952d82eb%252F5dae0995-d144-4ee6-a773-255de1f32558%252F%2525EB%25258B%2525A4%2525EA%2525B0%252599%2525EC%25259D%2525B4_%2525EC%2525A7%252591%2525EC%2525A4%252591222.jpg%3Ftable%3Dblock%26id%3D3346f7cb-073c-4f17-b18c-4d379a69aefc%26cache%3Dv2&w=3840&q=75',
      'exhibitionTitle': '모던 아트 특별展',
      'exhibitionImage':
          'https://www.kumc.or.kr/seasonPress/KUMM09/img_sub/KS46_img11.jpg',
      'likes': 21,
      'comments': 5,
      'content':
          '모던 아트의 새로운 방향성을 제시한 전시로, 작품 하나하나가 강렬한 메시지를 전달했습니다. 미술 애호가라면 놓칠 수 없는 전시였습니다.',
    },
    {
      'username': 'gallery_seeker',
      'profileImage': null,
      'artworkImage':
          'https://blog.kakaocdn.net/dn/Btedp/btrcM09KLtu/Ol5k0WebGkrPbebmoPzILK/img.jpg',
      'exhibitionTitle': '자연의 소리와 색',
      'exhibitionImage':
          'https://www.noblesse.com/shop/data/m/editor_new/2020/09/09/3cbef4f7922ef6b305.jpg',
      'likes': 7,
      'comments': 3,
      'content':
          '자연에서 영감을 받은 소리와 색감의 조화를 느낄 수 있었습니다. 작품마다 고유의 메시지가 살아 숨 쉬는 전시였습니다.',
    },
    {
      'username': 'classic_enthusiast',
      'profileImage': null,
      'artworkImage':
          'https://s3.ap-northeast-2.amazonaws.com/sf4l/hana/hanaschool_notice/2023/4rLK1k7hoWxqHh8612c5XV1eQuF3q5LZ0eSemA9J.jpg',
      'exhibitionTitle': '클래식과 현대의 만남',
      'exhibitionImage':
          'https://museumnews.kr/wp-content/uploads/2018/01/%EB%91%90%EB%B2%88%EC%A7%B8%ED%92%8D%EA%B2%BD-%EC%A0%84%EC%8B%9C-%ED%8F%AC%EC%8A%A4%ED%84%B0.jpg',
      'likes': 18,
      'comments': 12,
      'content':
          '클래식과 현대의 예술이 한데 어우러진 전시였습니다. 특히 조각 작품에서 세대 간의 예술적 교감을 느낄 수 있었습니다.',
    },
    {
      'username': 'art_mania',
      'profileImage': null,
      'artworkImage':
          'https://dmd10.wordpress.com/wp-content/uploads/2010/11/untitled.jpg',
      'exhibitionTitle': '미래 예술의 가능성',
      'exhibitionImage':
          'https://cdn.mhns.co.kr/news/photo/202109/511451_618343_3128.png',
      'likes': 30,
      'comments': 20,
      'content': '미래 기술과 예술의 융합을 탐구한 전시였습니다. 인공지능과 예술의 접목이 매우 신선하게 다가왔습니다.',
    },
    {
      'username': 'nature_harmony',
      'profileImage': null,
      'artworkImage':
          'https://blog.kakaocdn.net/dn/csxQ2C/btsHcLtmcWO/4g5X7Jr5BUIZ4jWo7b01kk/img.jpg',
      'exhibitionTitle': '자연과 인간',
      'exhibitionImage':
          'https://magazine.brique.co/wp-content/uploads/2022/05/%EC%A0%84%EC%8B%9C%ED%8F%AC%EC%8A%A4%ED%84%B0.jpg',
      'likes': 15,
      'comments': 6,
      'content': '자연과 인간의 관계를 예술로 풀어낸 전시였습니다. 특히 대형 설치 작품이 눈길을 끌었습니다.',
    },
    {
      'username': 'urban_art',
      'profileImage': null,
      'artworkImage':
          'https://design.yju.ac.kr/data/editor/2206/thumb-f12c8c668ecb4a66b58d3e89501bd186_1655255711_8669_835x626.jpg',
      'exhibitionTitle': '도시 속 예술',
      'exhibitionImage':
          'https://cdn.gukjenews.com/news/photo/202008/2056818_2054109_124.jpg',
      'likes': 9,
      'comments': 4,
      'content':
          '도시의 일상을 예술로 승화시킨 작품들이 인상 깊었습니다. 거리의 풍경이 캔버스 위에서 새로운 이야기를 만들어 냈습니다.',
    },
    {
      'username': 'light_shadow',
      'profileImage': null,
      'artworkImage':
          'https://blog.isusystem.com/wordpress/wp-content/uploads/2016/10/3_iot_after6.jpg',
      'exhibitionTitle': '빛과 그림자',
      'exhibitionImage':
          'https://img9.yna.co.kr/photo/yna/YH/2017/07/25/PYH2017072529480006100_P4.jpg',
      'likes': 22,
      'comments': 15,
      'content': '빛과 그림자의 상호작용을 극대화한 전시였습니다. 공간 활용과 조명이 독창적이었습니다.',
    },
    {
      'username': 'art_explorer',
      'profileImage': null,
      'artworkImage':
          'https://i.ytimg.com/vi/QK_KJMp1Lhk/hq720.jpg?sqp=-oaymwE7CK4FEIIDSFryq4qpAy0IARUAAAAAGAElAADIQj0AgKJD8AEB-AH-CYAC0AWKAgwIABABGGUgYShbMA8=&rs=AOn4CLDNND6_ZdPBhzhYeP7ybYLTiLC6yQ',
      'exhibitionTitle': '예술 탐험展',
      'exhibitionImage':
          'https://dimg.donga.com/wps/NEWS/IMAGE/2020/12/01/104228292.2.jpg',
      'likes': 17,
      'comments': 9,
      'content': '다양한 장르의 작품들이 어우러진 전시였습니다. 작품 간의 연결성이 돋보였습니다.',
    },
    {
      'username': 'timeless_art',
      'profileImage': null,
      'artworkImage':
          'https://www.kf.or.kr/old/newsletter/newsletter_home/up_limages/19_7news03_kor.jpg',
      'exhibitionTitle': '시간과 공간',
      'exhibitionImage':
          'https://ojsfile.ohmynews.com/STD_IMG_FILE/2022/0314/IE002956567_STD.JPG',
      'likes': 20,
      'comments': 11,
      'content': '시간과 공간의 개념을 재해석한 전시였습니다. 관람객의 참여를 유도하는 작품이 인상 깊었습니다.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('리뷰'),
      ),
      body: ListView.builder(
        itemCount: reviews.length,
        itemBuilder: (context, index) {
          final review = reviews[index];
          return  ReviewItem(
            username:review['username'],
            artworkImage: review['artworkImage'],
            exhibitionImage: review['exhibitionImage'],
            exhibitionTitle: '',
            likes: review['likes'],
            comments: review['comments'],
            content: review['content'],
          );
        },
      ),
    );
  }
}
