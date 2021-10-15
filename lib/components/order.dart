import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shop/models/order.dart';

class OrderWidget extends StatefulWidget {
  final Order order;

  const OrderWidget({
    required this.order,
    Key? key,
  }) : super(key: key);

  @override
  _OrderWidgetState createState() => _OrderWidgetState();
}

class _OrderWidgetState extends State<OrderWidget> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final itemsHeight = (widget.order.products.length * 25.0) + 10;
    return Column(
      children: [
        AnimatedContainer(
          duration: Duration(milliseconds: 300),
          height: _expanded ? itemsHeight + 80 : 80,
          child: Card(
            child: Column(
              children: [
                ListTile(
                  title: Text('R\$ ${widget.order.total.toStringAsFixed(2)}'),
                  subtitle: Text(
                    DateFormat('dd/mm/yyyy hh:mm').format(widget.order.date),
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.expand_more),
                    onPressed: () {
                      setState(() {
                        _expanded = !_expanded;
                      });
                    },
                  ),
                ),
                  AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    height: _expanded ? itemsHeight : 0,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 4,
                    ),
                    child: ListView(
                      children: widget.order.products.map((prod) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              prod.name,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '${prod.quantity}x R\$${prod.price}',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        );
                      }).toList(),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
