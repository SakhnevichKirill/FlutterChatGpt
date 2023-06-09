import 'package:custom_chat_gpt/common/app_colors.dart';
import 'package:custom_chat_gpt/feature/presentation/bloc/test_bloc/chat_bloc.dart';
import 'package:custom_chat_gpt/feature/presentation/widget/list_of_chats.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DrawerContent extends StatefulWidget {
  const DrawerContent({super.key});

  @override
  State<DrawerContent> createState() => _DrawerContentState();
}

class _DrawerContentState extends State<DrawerContent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.cellBackground,
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: AppColors.dividerColor,
                ),
              ),
            ),
            // Add new chat buttom
            child: ListTile(
              onTap: () {
                BlocProvider.of<ChatBloc>(context).add(AddNewChat());
              },
              leading: const Icon(
                Icons.add,
                color: AppColors.iconBlueColor,
              ),
              title: const Text(
                'Добавить чат',
                style: TextStyle(
                  color: AppColors.iconBlueColor,
                ),
              ),
            ),
          ),
          Expanded(
              flex: 6,

              // TODO: BUG: При добавлении нового чата, актуальный чат пропадает
              child: BlocBuilder<ChatBloc, ChatState>(
                builder: (context, state) {
                  // print(BlocProvider.of<ChatBloc>(context)
                  //     .repository
                  //     .chats
                  //     .keys
                  //     .toList());
                  return ListOfChats(
                      chatNames: BlocProvider.of<ChatBloc>(context)
                          .repository
                          .chats
                          .keys
                          .toList());
                },
              )

              // ListView(
              //   children: [
              //     ...testChatNames
              //         .map(
              //           (e) => ListTile(
              //             leading: const Icon(Icons.message_rounded),
              //             title: Text(e),
              //             trailing: SizedBox(
              //               width: 120,
              //               child: Row(
              //                 // mainAxisSize: MainAxisSize.max,
              //                 children: [
              //                   IconButton(
              //                     onPressed: () {},
              //                     icon: const Icon(
              //                       Icons.file_upload_outlined,
              //                       color: AppColors.iconBlueColor,
              //                     ),
              //                   ),
              //                   IconButton(
              //                     onPressed: () {},
              //                     icon: const Icon(
              //                       Icons.edit_outlined,
              //                       color: AppColors.iconBlueColor,
              //                     ),
              //                   ),
              //                   IconButton(
              //                     onPressed: () {},
              //                     icon: const Icon(
              //                       Icons.delete_outline,
              //                       color: AppColors.iconRedColor,
              //                     ),
              //                   ),
              //                 ],
              //               ),
              //             ),
              //           ),
              //         )
              //         .toList()
              //   ],
              // ),
              ),
          Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: AppColors.dividerColor,
                    ),
                  ),
                ),
                child: const ListTile(
                  leading: Icon(
                    Icons.delete_outline,
                    color: AppColors.iconRedColor,
                  ),
                  title: Text('Удалить все чаты'),
                ),
              ),
              const ListTile(
                leading: Icon(
                  Icons.settings,
                  color: AppColors.iconBlueColor,
                ),
                title: Text('Настройки'),
              ),
              const ListTile(
                leading: Icon(
                  Icons.settings,
                  color: AppColors.iconBlueColor,
                ),
                title: Text('Помощь & FAQ'),
              ),
              const ListTile(
                leading: Icon(
                  Icons.delete_outline,
                  color: AppColors.iconRedColor,
                ),
                title: Text('Выйти'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// List<String> testChatNames = [
//   'Chat theme 1',
//   'Chat theme 2',
//   'Chat theme 3',
//   'Chat theme 1',
//   'Chat theme 2',
//   'Chat theme 3',
//   'Chat theme 1',
//   'Chat theme 2',
//   'Chat theme 3',
//   'Chat theme 1',
//   'Chat theme 2',
//   'Chat theme 3',
//   'Chat theme 1',
//   'Chat theme 2',
//   'Chat theme 3',
//   'Chat theme 1',
//   'Chat theme 2',
//   'Chat theme 3',
//   'Chat theme 1',
//   'Chat theme 2',
//   'Chat theme 3',
//   'Chat theme 1',
//   'Chat theme 2',
//   'Chat theme 3',
//   'Chat theme 1',
//   'Chat theme 2',
//   'Chat theme 3',
// ];
