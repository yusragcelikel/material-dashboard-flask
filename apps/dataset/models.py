# apps/dataset/models.py

class Dataset:
    datasets = []
    next_id = 1

    @classmethod
    def add(cls, number_of_data, algorithm, accuracy, f1_score):
        cls.datasets.append({
            'id': cls.next_id,
            'number_of_data': number_of_data,
            'algorithm': algorithm,
            'accuracy': accuracy,
            'f1_score': f1_score
        })
        cls.next_id += 1

    @classmethod
    def get_all(cls):
        return cls.datasets

    @classmethod
    def get_by_id(cls, id):
        return next((d for d in cls.datasets if d['id'] == id), None)

    @classmethod
    def update(cls, id, number_of_data, algorithm, accuracy, f1_score):
        dataset = cls.get_by_id(id)
        if dataset:
            dataset['number_of_data'] = number_of_data
            dataset['algorithm'] = algorithm
            dataset['accuracy'] = accuracy
            dataset['f1_score'] = f1_score

    @classmethod
    def delete(cls, id):
        cls.datasets = [d for d in cls.datasets if d['id'] != id]
