<?php
// *	@copyright	OPENCART.PRO 2011 - 2016.
// *	@forum	http://forum.opencart.pro
// *	@source		See SOURCE.txt for source and other copyright.
// *	@license	GNU General Public License version 3; see LICENSE.txt

class PaginationCatalog {
	public $total = 0;
	public $page = 1;
	public $limit = 20;
	public $num_links = 8;
	public $url = '';
	public $text_first = '';
	public $text_last = '';
	public $text_next = '<svg class="pagination__icon" viewBox="0 0 10 16"><path d="M10 8L2.06897 -6.93353e-07L1.21632e-06 2.08695L5.86207 8L1.82448e-07 13.913L2.06897 16L10 8Z"></path></svg>';
	public $text_prev = '<svg class="pagination__icon" viewBox="0 0 10 16"><path d="M0 8L7.93103 16L10 13.913L4.13793 8L10 2.08696L7.93103 0L0 8Z"></path></svg>';

	public function render() {
		$total = $this->total;

		if ($this->page < 1) {
			$page = 1;
		} else {
			$page = $this->page;
		}

		if (!(int)$this->limit) {
			$limit = 10;
		} else {
			$limit = $this->limit;
		}

		$num_links = $this->num_links;
		$num_pages = ceil($total / $limit);

		$this->url = str_replace('%7Bpage%7D', '{page}', $this->url);

		$output = '<div class="pagination">';

		if ($page > 1) {
			$output .= '';
			
			if ($page - 1 === 1) {
				$output .= '<a class="pagination__btn pagination__btn_prev" href="' . str_replace(array('&amp;page={page}', '&page={page}', '?page={page}'), '', $this->url) . '">' . $this->text_prev . '</a>';
			} else {
				$output .= '<a class="pagination__btn pagination__btn_prev" href="' . str_replace('{page}', $page - 1, $this->url) . '">' . $this->text_prev . '</a>';
			}
		}

		if ($num_pages > 1) {
			if ($num_pages <= $num_links) {
				$start = 1;
				$end = $num_pages;
			} else {
				$start = $page - floor($num_links / 2);
				$end = $page + floor($num_links / 2);

				if ($start < 1) {
					$end += abs($start) + 1;
					$start = 1;
				}

				if ($end > $num_pages) {
					$start -= ($end - $num_pages);
					$end = $num_pages;
				}
			}

			for ($i = $start; $i <= $end; $i++) {
				if ($page == $i) {
					$output .= '<a class="pagination__btn pagination__btn_page pagination__btn_current" aria-label="Страница 1">' . $i . '</a>';
				} else {
					if ($i === 1) {
					$output .= '<a class="pagination__btn pagination__btn_page" href="' . str_replace(array('&amp;page={page}', '&page={page}', '?page={page}'), '', $this->url) . '">' . $i . '</a>';
					} else {
						$output .= '<a class="pagination__btn pagination__btn_page" href="' . str_replace('{page}', $i, $this->url) . '">' . $i . '</a>';
					}
				}
			}
		}

		if ($page < $num_pages) {
			$output .= '<a class="pagination__btn pagination__btn_next" href="' . str_replace('{page}', $page + 1, $this->url) . '">' . $this->text_next . '</a>';
			$output .= '';
		}

		$output .= '</div>';

		if ($num_pages > 1) {
			return $output;
		} else {
			return '';
		}
	}
}
