import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:math';

class Point {
  final String id;
  final double x;
  final double y;

  Point(this.id,this.x, this.y);
}

class Cluster {
  Point centroid;
  List<Point> points;

  Cluster(this.centroid, [List<Point>? points])
      : this.points = points ?? []; // 수정된 부분
}
