import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:like_button/like_button.dart';

class ReviewItem extends StatelessWidget {
  final String username;
  final String? profileImage;
  final String artworkImage;
  final String exhibitionImage;
  final String exhibitionTitle;
  final int likes;
  final int comments;
  final String content;

  const ReviewItem({
    Key? key,
    required this.username,
    this.profileImage,
    required this.artworkImage,
    required this.exhibitionImage,
    required this.exhibitionTitle,
    required this.likes,
    required this.comments,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Profile section
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.grey.shade300,
                    radius: 20,
                    backgroundImage:
                    profileImage != null ? NetworkImage(profileImage!) : null,
                    child: profileImage == null
                        ? Icon(Icons.person, color: Colors.grey)
                        : null,
                  ),
                  SizedBox(width: 12),
                  Text(
                    username,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Icon(
                      Icons.check,
                      size: 14,
                    ),
                  ),
                  Text('팔로잉'),
                  SizedBox(width: 12),
                  Icon(Icons.more_vert),
                ],
              )
            ],
          ),
        ),
        SizedBox(height: 16),
        // Artwork image
        AspectRatio(
          aspectRatio: 4 / 3,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(0),
            child: Image.network(
              artworkImage,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                color: Colors.grey.shade200,
              ),
            ),
          ),
        ),
        SizedBox(height: 5),
        // Exhibition info
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Card(
            elevation: 0,
            color: Colors.white,
            shape: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Row(
                children: [
                  Image.network(
                    exhibitionImage,
                    width: 50,
                    height: 60,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      width: 50,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                      ),
                      child: Center(
                        child: Icon(Icons.image, color: Colors.grey),
                      ),
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      exhibitionTitle,
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 12),
        // Likes, comments, share
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  LikeButton(
                    likeBuilder: (bool isLiked) {
                      // Change icon based on like status
                      return SvgPicture.asset(
                        isLiked
                            ? 'assets/icons/favorite.svg'
                            : 'assets/icons/favorite_outline.svg',
                      );
                    },
                  ),
                  SizedBox(width: 4),
                  Text(likes.toString()),
                  SizedBox(width: 12),
                  SvgPicture.asset('assets/icons/comment.svg'),
                  SizedBox(width: 4),
                  Text(comments.toString()),
                ],
              ),
              SvgPicture.asset('assets/icons/share.svg'),
            ],
          ),
        ),
        SizedBox(height: 16),
        // Review content
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            content,
            style: TextStyle(fontSize: 14, color: Colors.grey[800]),
            maxLines: 6,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        SizedBox(height: 30),
      ],
    );
  }
}
