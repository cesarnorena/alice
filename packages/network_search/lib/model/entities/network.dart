import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'network.g.dart';

@immutable
@JsonSerializable()
class Network extends Equatable {
  Network(this.name);

  factory Network.fromJson(Map<String, dynamic> json) =>
      _$NetworkFromJson(json);

  final String name;

  @override
  List<Object> get props => [name];
}
