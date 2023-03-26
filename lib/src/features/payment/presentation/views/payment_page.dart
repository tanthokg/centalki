import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/payment_bloc/payment_bloc.dart';
import 'payment_view.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider<PaymentBloc>(
        create: (context) =>
            PaymentBloc()..add(const PaymentLoadPaymentMethodsEvent()),
        child: const PaymentView(),
      );
}
