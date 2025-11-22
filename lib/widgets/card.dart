import 'package:flutter/material.dart';
import '../models/plant.dart';

class PlantCard extends StatelessWidget {
	final Plant plant;
	final VoidCallback? onTap;
	final double? width;

	const PlantCard({Key? key, required this.plant, this.onTap, this.width}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return SizedBox(
			width: width,
			child: Card(
				elevation: 2,
				shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
				child: InkWell(
					borderRadius: BorderRadius.circular(12),
					onTap: onTap,
					child: Padding(
						padding: const EdgeInsets.all(12.0),
						child: Row(
							children: [
								// Image
								ClipRRect(
									borderRadius: BorderRadius.circular(8),
									child: SizedBox(
										width: 80,
										height: 80,
										child: Image.asset(
											plant.image,
											fit: BoxFit.cover,
											errorBuilder: (context, error, stack) => Container(
												color: Colors.grey[200],
												child: const Icon(Icons.local_florist, size: 40, color: Colors.green),
											),
										),
									),
								),
								const SizedBox(width: 12),

								// Textual info
								Expanded(
									child: Column(
										crossAxisAlignment: CrossAxisAlignment.start,
										mainAxisSize: MainAxisSize.min,
										children: [
											Text(
												plant.name,
												style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
											),
											const SizedBox(height: 4),
											Text(
												plant.species,
												style: TextStyle(fontSize: 12, color: Colors.grey[700]),
											),
											const SizedBox(height: 8),

											// Sunlight
											Row(
												children: [
													const Icon(Icons.wb_sunny, size: 14, color: Colors.orange),
													const SizedBox(width: 6),
													Expanded(
														child: Text(
															plant.sunlight,
															style: const TextStyle(fontSize: 12),
															overflow: TextOverflow.ellipsis,
														),
													),
												],
											),
											const SizedBox(height: 4),

											// Water
											Row(
												children: [
													const Icon(Icons.opacity, size: 14, color: Colors.blue),
													const SizedBox(width: 6),
													Expanded(
														child: Text(
															plant.water,
															style: const TextStyle(fontSize: 12),
															overflow: TextOverflow.ellipsis,
														),
													),
												],
											),
										],
									),
								),
							],
						),
					),
				),
			),
		);
	}
}

