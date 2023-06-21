import 'package:domain/domain.dart';

import '../entities/entities.dart';

class MessageMapper {
  static MessageModel mapToModel(MessageEntity entity) {
    return MessageModel(
      data: entity.data,
    );
  }

  static MessageEntity mapToEntity(MessageModel model) {
    return MessageEntity(
      data: model.data,
    );
  }
}
