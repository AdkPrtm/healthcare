import 'dart:async';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:healthcare/bloc/medicalhistory_bloc.dart';
import 'package:healthcare/bloc/user_bloc.dart';
import 'package:healthcare/models/models.dart';
import 'package:healthcare/screens/widgets/widgets.dart';
import 'package:healthcare/shared/shared.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

part 'splash_page.dart';
part 'menu_login_page.dart';
part 'login_page.dart';
part 'signup_page.dart';
part 'noconnection_page.dart';
part 'introduction_page.dart';
part 'main_page.dart';
part 'home_page.dart';
part 'notification_page.dart';
part 'affirmation_page.dart';
part 'settings_page.dart';
part 'add_medical_page.dart';
part 'edit_profile_page.dart';